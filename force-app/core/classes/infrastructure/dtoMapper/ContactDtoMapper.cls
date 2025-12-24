public class ContactDtoMapper {
    public static ContactDto toDto(Contact contact) {
        ContactDto dto = new ContactDto();
        dto.id = contact.Id;
        dto.firstname = contact.FirstName;
        dto.lastname = contact.LastName;

        return dto;
    }

    public static List<ContactDto> toDtos(List<Contact> contacts) {
        List<ContactDto> dtos = new List<ContactDto>();

        for (Contact contact : contacts) {
            dtos.add(toDto(contact));
        }

        return dtos;
    }

    public static Contact toSObject(ContactDto dto) {
        Contact contact = new Contact();
        contact.Id = dto.id;
        contact.FirstName = dto.firstname;
        contact.LastName = dto.lastname;

        return contact;
    }

    public static List<Contact> toSObjects(List<ContactDto> dtos) {
        List<Contact> sObjs = new List<Contact>();

        for (ContactDto dto : dtos) {
            sObjs.add(toSObject(dto));
        }

        return sObjs;
    }
}