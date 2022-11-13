// SPDX-License-Identifier: MIT
pragma solidity >0.8.0 <0.9.0;

contract EventOrganization{

    uint eventID;

    struct Event {
        address Event_Organizer;
        string Event_Name;
        uint Event_Date;
        uint Event_Price;
        uint Event_Total_Tickets;
        uint Event_Remain_Tickets;
    }

    mapping(uint => Event) public events;
    mapping(address => mapping(uint => uint)) public tickets;

    function createEvent(string memory _event_name, uint _event_date, uint _event_price, uint _event_total_tickets) external {
        require(_event_date > block.timestamp + 1 days, "You can't set event in past, event date must be after one day");
        require(_event_total_tickets > 0 , "You can organize event, when amount of tickets more than 0");
        events[eventID] = Event(msg.sender, _event_name, _event_date, _event_price, _event_total_tickets, _event_total_tickets);
        eventID++;
    }

    function Buy_Tickets(uint Event_ID, uint Event_Quantity) external payable {
        require(events[Event_ID].Event_Date != 0, "Event not exist");
        require(events[Event_ID].Event_Date > block.timestamp, "Event has already occured");
        Event storage _event = events[eventID];
        require(msg.value == (_event.Event_Price*Event_Quantity));
        require(_event.Event_Remain_Tickets >= Event_Quantity, "Not enough tickets");
        require(msg.value == events[Event_ID].Event_Price , "Please Pay Correct Amount");
        payable(events[Event_ID].Event_Organizer).transfer(msg.value);
        _event.Event_Remain_Tickets -= Event_Quantity;
        tickets[msg.sender][Event_ID] += Event_Quantity;
    }

    function Transfer_Tickets(uint Event_ID, uint Ticket_Quantity, address to) external {
        require(events[Event_ID].Event_Date != 0, "Event not exist");
        require(events[Event_ID].Event_Date > block.timestamp, "Event has already occured");
        require(tickets[msg.sender][Event_ID] >= Ticket_Quantity, "You do not have enough tickets");
        tickets[msg.sender][eventID] -= Ticket_Quantity;
        tickets[to][eventID] += Ticket_Quantity;   
    }
}