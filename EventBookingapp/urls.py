from django.urls import path
from . import views


urlpatterns = [
    path('', views.signin_view, name='signin'),
    path('signin/', views.signin_view, name='signin'),
    path('signup/', views.signup_view, name='signup'),
    path('logout/', views.logout_view, name='logout'),
    path('dashboard/', views.dashboard_view, name='dashboard'),
    path('admin_dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('AddEventView/', views.AddEventView, name='AddEventView'),
    path('DeleteEventView/', views.DeleteEventView, name='DeleteEventView'),
    path('TicketbookingView/', views.TicketbookingView, name='TicketbookingView'),
    path('ShowBookingView/', views.ShowBookingView, name='ShowBookingView'),
    path('SoldOutView/', views.SoldOutView, name='SoldOutView'),
 ]