from django.shortcuts import get_object_or_404, render, redirect
from django.contrib import messages
from EventBookingapp.Email import TicketEmail
from .forms import *
from .models import *
import uuid
from django.contrib.auth import login,authenticate
from django.contrib.auth.decorators import login_required

def signup_view(request):
    try:
        # if request.user.is_authenticated:
        #     return redirect('dashboard')
        if request.method == 'POST':
            form = SignupForm(request.POST)
            if form.is_valid():
                UserForm = form.save(commit=False)
                UserForm.set_password(form.cleaned_data['password'])
                UserForm.is_staff = False
                UserForm.is_superuser = False
                UserForm.save()
                return redirect('signin')
        else:
         form = SignupForm()
    except Exception as e:
        messages.error(request, f"Signup failed: {str(e)}")
        form = SignupForm()
    return render(request, 'EventBookingapp/signup.html', {'form': form})

def signin_view(request):
    try:
        if request.method == 'POST':
            form = SigninForm(request.POST)
            if form.is_valid():
                username = form.cleaned_data['username']
                password = form.cleaned_data['password']
                user = authenticate(request, username=username, password=password)
                if user is not None:
                    login(request, user)
                    if user.is_admin or user.is_staff:
                        return redirect('admin_dashboard')
                    else:
                        return redirect('dashboard')
                else:
                    messages.error(request, 'Invalid username or password.')
        else:
            form = SigninForm()
    except Exception as e:
        messages.error(request, f"Signup failed: {str(e)}")
    return render(request, 'EventBookingapp/signin.html', {'form': form})

def logout_view(request):
    try:
        if request.session.get('user_id'):
            request.session.flush()
    except Exception as e:
        messages.error(request, f"Logout failed: {str(e)}")
    return redirect('signin')

@login_required
def dashboard_view(request):
    try:
        EventsInfo=Events.objects.all()
        return render(request, 'EventBookingapp/dashboard.html', {'EventsInfo': EventsInfo})
    except Exception as e:
        messages.error(request, f"Dashboard error: {str(e)}")
    return redirect('signin')

@login_required
def admin_dashboard(request):
    try:
        if not (request.user.is_admin or request.user.is_staff):
            messages.error(request, 'You do not have permission to access this page')
            return redirect('dashboard')
        events = Events.objects.all()
        for event in events:
            if event.event_available_seats < 1:
                event.is_sold_out = True
            event.save(update_fields=['is_sold_out'])
    except Exception as e:
        print("Exception",e)
    return render(request, 'EventBookingapp/admin_dashboard.html', {'events': events})

def TicketbookingView(request):
    try:
        EventId=request.GET.get('EventId') or request.POST.get('EventId')
        EventsInfo=Events.objects.get(event_id=EventId)
        if request.method == 'POST':
            form = TicketBookingForm(request.POST)
            if form.is_valid():
                Totalprice = form.cleaned_data['seats'] * EventsInfo.event_price
                if EventsInfo.event_available_seats < form.cleaned_data['seats']:
                    messages.error(request, 'Not enough seats available.')
                else:
                    BookingForm = form.save(commit=False)
                    BookingForm.event_id=EventId
                    BookingForm.booking_id=uuid.uuid4().hex[:12].upper()
                    BookingForm.price=Totalprice
                    BookingForm.save()
                    TicketEmail(BookingForm,EventsInfo)
                    BookingDetails=Bookingdetails.objects.get(event_id=EventId,booking_id=BookingForm.booking_id)
                    EventsInfo.event_available_seats = EventsInfo.event_available_seats - form.cleaned_data['seats']
                    EventsInfo.save(update_fields=['event_available_seats'])
                    return render(request, 'EventBookingapp/TicketBooking.html',{'EventsInfo': EventsInfo,'EventId':EventId,'BookingDetails':BookingDetails, 'show_popup': True})
    except Exception as e:
        print("Exception",e)
    return render(request, 'EventBookingapp/TicketBooking.html', {'EventsInfo': EventsInfo,'EventId':EventId})

def AddEventView(request):
    try:
        event_id = int(request.GET.get('EventId') or 0)
        event = get_object_or_404(Events, pk=event_id) if event_id else None
        if request.method == 'POST':
            if event_id:
                form = EventForm(request.POST, instance=event)
                if form.is_valid():
                    event_obj = form.save(commit=False)
                    event_obj.event_available_seats = form.cleaned_data['event_total_seats']
                    event_obj.save()
                    return redirect('admin_dashboard')
            else:
                form = EventForm(request.POST)
                if form.is_valid():
                    event_obj = form.save(commit=False)
                    event_obj.event_available_seats = form.cleaned_data['event_total_seats']
                    event_obj.save()
                    return redirect('admin_dashboard')
        form = EventForm(instance=event) if event_id else EventForm()
    except Exception as e:
        messages.error(request, f"Error while processing event: {str(e)}")
    return render(request, 'EventBookingapp/AddEvent.html', {'form': form,'event_id':event_id})


def DeleteEventView(request):
    try:
        EventId = request.GET.get('EventId') or 0
        EventData=Events.objects.filter(event_id=EventId)
        EventData.delete()
    except Exception as e:
        messages.error(request, f"Error while processing event: {str(e)}")
    return redirect('admin_dashboard')

def ShowBookingView(request):
    try:
        EventId = request.GET.get('EventId') or 0
        events = Events.objects.filter(event_id=EventId)
        BookingDetails=Bookingdetails.objects.filter(event_id=EventId)
    except Exception as e:
        messages.error(request, f"Error while processing event: {str(e)}")
    return render(request, 'EventBookingapp/ViewBooking.html', {'events': events,'BookingDetails':BookingDetails})

def SoldOutView(request):
    try:
        EventId = request.GET.get('EventId') or 0
        EventsInfo=Events.objects.get(event_id=EventId)
        EventsInfo.is_sold_out = True
        EventsInfo.save(update_fields=['is_sold_out'])
    except Exception as e:
        messages.error(request, f"Error while processing event: {str(e)}")
    return redirect('admin_dashboard')
















