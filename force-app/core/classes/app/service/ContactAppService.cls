public with sharing class ContactAppService {
    private ContactSelector contactSelector {
        get {
            return (ContactSelector) DependencyInjector.getInstance(ContactSelector.class);
        }
    }

    public ContactDto getContact(Id contactId) {
        Contact contact = this.contactSelector.getById(contactId);

        return ContactDtoMapper.toDto(contact);
    }

    public List<ContactDto> createContacts(List<ContactDto> dtos) {
        List<Contact> contacts = ContactDtoMapper.toSObjects(dtos);
        Database.insert(contacts, AccessLevel.USER_MODE);

        return ContactDtoMapper.toDtos(contacts);
    }
}