from django import template

register = template.Library()

@register.filter
def seats_left(event):
    if not event:
        return 0
    total_seats = event.event_total_seats or 0
    booked_seats = event.booked_seats
    return max(0, total_seats - booked_seats)