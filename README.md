Django Event Booking System
===========================

Overview:
---------
A mini Django-based event booking web application for managing bookings in a small auditorium or community center. Includes admin management, user registration, and ticket confirmation via email.

Features:
---------
Visitors:
- View upcoming events
- Book tickets (Name, Email, Seats)
- Receive booking confirmation

Admins:
- Login with custom AbstractUser model
- Create, update, and delete events
- View bookings
- Mark events as Sold Out

Technology Stack:
-----------------
- Python 3.12
- Django 4.x
- MySQL
- Bootstrap 5
- SweetAlert2
- Django console email backend

Project Structure:
------------------
├── db.sqlite3                     : (Unused if using MySQL)
├── manage.py                     : Django management script
├── project_structure.txt         : Project layout reference

├── EventBookingProject/          : Django project folder
│   ├── settings.py               : Project settings
│   ├── urls.py                   : Project URL routing
│   └── wsgi.py / asgi.py         : Server gateway

├── EventBookingapp/              : Main Django app
│   ├── admin.py                  : Admin configurations
│   ├── models.py                 : Models: Events, Bookings, CustomUser
│   ├── forms.py                  : Django forms
│   ├── views.py                  : All view logic (booking, admin, auth)
│   ├── urls.py                   : App-specific routing
│   ├── Email.py                  : Email sending logic
│   ├── context_processors.py     : Adds next upcoming event to all templates
│   ├── templatetags/
│   │   └── event_filters.py      : Custom filters (e.g., seats left)
│   ├── templates/
│   │   └── EventBookingapp/
│   │       ├── base.html
│   │       ├── dashboard.html
│   │       ├── signup.html / signin.html
│   │       ├── AddEvent.html
│   │       ├── TicketBooking.html
│   │       ├── ViewBooking.html
│   │       └── admin_dashboard.html
│   ├── static/
│   │   └── style.css             : Custom styles
│   └── migrations/               : Auto-generated migration scripts

Setup Instructions:
-------------------
1. Clone the repository:
   git clone <your_repo_link>
   cd event-booking-app

2. Create virtual environment:
   python -m venv venv
   venv\Scripts\activate    (on Windows)

3. Install requirements:
   pip install -r requirements.txt

4. Install MySQL client:
   pip install mysqlclient

5. Configure MySQL in settings.py:
   DATABASES = {
       'default': {
           'ENGINE': 'django.db.backends.mysql',
           'NAME': 'your_db_name',
           'USER': 'your_mysql_user',
           'PASSWORD': 'your_password',
           'HOST': 'localhost',
           'PORT': '3306',
       }
   }

6. Run migrations:
   python manage.py makemigrations
   python manage.py migrate

7. Create superuser:
   python manage.py createsuperuser

8. Start development server:
   python manage.py runserver

9. Access the application:
   http://127.0.0.1:8000/

Email Setup (Console Backend):
------------------------------
For development, email confirmation messages are printed in the terminal.  
Make sure your settings.py includes:
   EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

User Notes:
-----------
- Admin users must be created with `createsuperuser`.
- Regular users can register through the `/signup/` page.

Contact:
-----------
Maintained by: Vasanth S
Email: vasanthkumar49480@gmail.com

References:
-----------
Django Docs: https://docs.djangoproject.com/en/stable/
- Custom User Model: https://docs.djangoproject.com/en/stable/topics/auth/customizing/
- https://medium.com/django-unleashed/custom-user-model-in-django-98b9a401a6a2
- Sending Email: https://docs.djangoproject.com/en/stable/topics/email/
- Custom Template Tags: https://docs.djangoproject.com/en/stable/howto/custom-template-tags/

Third-Party Tools:
- SweetAlert2: https://sweetalert2.github.io/
- Tempus Dominus DateTime Picker: https://getdatepicker.com/6/
