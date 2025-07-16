from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import CustomUser


class CustomUserAdmin(UserAdmin):
    model = CustomUser
    fieldsets = UserAdmin.fieldsets + (
        ('Additional Info', {'fields': ('full_name',)}),
    )
    list_display = ['username', 'email', 'is_staff', 'full_name']

admin.site.register(CustomUser, CustomUserAdmin)