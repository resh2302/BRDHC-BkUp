using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for eventsClass
/// </summary>
public class eventsClass
{
    public IQueryable<brdhc_Event> getEvents()
    {
        eventsCalendarDataContext objEvents = new eventsCalendarDataContext();
        var allEvents = objEvents.brdhc_Events.Select(x => x);
        return allEvents;
    }

    public IQueryable<brdhc_Event> getEventByID(Guid eventID)
    {
        eventsCalendarDataContext objEvents = new eventsCalendarDataContext();
        var singleEvent = objEvents.brdhc_Events.Where(x => x.EventId == eventID).Select(x => x);
        return singleEvent;
    }

    public IQueryable<brdhc_Event> upcomingEvents()
    {
        eventsCalendarDataContext objUp = new eventsCalendarDataContext();
        var upcoming = objUp.brdhc_Events.Where(x => x.EventDate >= DateTime.Today).Select(x => x).Take(3);
        //(from u in objUp.brdhc_Events where u.EventDate >= DateTime.Today select u);
        return upcoming;
    }

    public bool insertEvent(Guid eventID, string _title, string _description, Guid _createdBy, DateTime _date, string _start,
        string _end, string _location, string _heldBy //bool _isApproved
        )
    {
        eventsCalendarDataContext objEvents = new eventsCalendarDataContext();
        using (objEvents)
        {
            brdhc_Event objNewEvent = new brdhc_Event();
            objNewEvent.EventId = Guid.NewGuid();
            objNewEvent.EventTitle = _title;
            objNewEvent.EventDescription = _description;
            objNewEvent.EventCreatedBy = Guid.Parse(_createdBy.ToString());
            objNewEvent.EventDate = _date;
            objNewEvent.EventStartTime = _start;
            objNewEvent.EventEndTime = _end;
            objNewEvent.EventLocation = _location;
            objNewEvent.EventsHeldBy = _heldBy;
            //objNewEvent.IsApproved = _isApproved;
            objEvents.brdhc_Events.InsertOnSubmit(objNewEvent);
            objEvents.SubmitChanges();
            return true;
        }
    }

    public bool deleteEvent(Guid eventID)
    {
        eventsCalendarDataContext objEvents = new eventsCalendarDataContext();
        using (objEvents)
        {
            var events = objEvents.brdhc_Events.Where(x => x.EventId == eventID);
            objEvents.brdhc_Events.DeleteAllOnSubmit(events);
            objEvents.SubmitChanges();
            return true;
        }
    }

    public void updateEvent(string eventId, string _title, string _description, string _date, string _start,
        string _end, string _location, string _heldBy)
    {
        eventsCalendarDataContext objEvents = new eventsCalendarDataContext();
        var events = objEvents.brdhc_Events.Single(x => x.EventId == new Guid(eventId));

        events.EventTitle = _title;
        events.EventDescription = _description;
        events.EventDate = DateTime.Parse(_date.ToString());
        events.EventStartTime = _start;
        events.EventEndTime = _end;
        events.EventLocation = _location;
        events.EventsHeldBy = _heldBy;
        objEvents.SubmitChanges();
    }
}