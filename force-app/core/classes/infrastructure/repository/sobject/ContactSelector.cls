public with sharing class ContactSelector {
    public Contact getById(Id recordId) {
        List<Contact> contacts = this.getByIds(new Set<Id>{ recordId });
        return contacts.isEmpty() ? null : contacts.get(0);
    }

    public List<Contact> getByIds(Set<Id> recordIds) {
        return [
                SELECT Id, FirstName, LastName
                FROM Contact
                WHERE Id IN :recordIds
                WITH USER_MODE
        ];
    }
}