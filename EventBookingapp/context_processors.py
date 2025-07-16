from django.contrib import messages
from .models import Events
from datetime import datetime

def upcoming_event(request):
    try:
        next_event = Events.objects.filter(
            event_scheduled_date__gte=datetime.now()
        ).order_by('event_scheduled_date').first()
    except Exception as e:
        print(e)
        messages.error(request, f"Exception: {str(e)}")
        next_event = None

    return {'next_upcoming_event': next_event}
