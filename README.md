# Event Organization Smart Contract
- This is a Solidity smart contract that facilitates the organization of events, allowing the creation of events and the purchase and transfer of tickets.

### Prerequisites
1. Solidity >0.8.0 <0.9.0
2. Ethereum development environment

### Usage
#### Creating an event:
- To create an event, call the createEvent function, passing in the following parameters:

_event_name (string): The name of the event.
_event_date (uint): The date of the event as a Unix timestamp.
_event_price (uint): The price of a ticket for the event.
_event_total_tickets (uint): The total number of tickets available for the event.
Buying tickets
To buy tickets, call the Buy_Tickets function, passing in the following parameters:

Event_ID (uint): The ID of the event you want to buy tickets for.
Event_Quantity (uint): The number of tickets you want to buy.
You will also need to send the correct amount of Ether to purchase the tickets.

Transferring tickets
To transfer tickets, call the Transfer_Tickets function, passing in the following parameters:

Event_ID (uint): The ID of the event you want to transfer tickets for.
Ticket_Quantity (uint): The number of tickets you want to transfer.
to (address): The address of the recipient of the tickets.

License
This project is licensed under the terms of the MIT license.
