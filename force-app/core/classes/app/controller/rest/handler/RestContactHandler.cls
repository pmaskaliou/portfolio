public with sharing class RestContactHandler extends AbstractRestHandler {
    private ContactAppService contactAppService {
        get {
            return (ContactAppService) DependencyInjector.getInstance(ContactAppService.class);
        }
    }

    public override void handleGet() {
        try {
            Id contactId = (Id) RestContextFacade.getParam('id');
            ContactDto contactDto = this.contactAppService.getContact(contactId);

            RestContextFacade.setResponseBody(contactDto);
        } catch (StringException e) {
            throw new InvalidDataException('Invalid id: ' + RestContextFacade.getParam('id'));
        }
    }

    public override void handlePost() {
        try {
            List<ContactDto> contactDtos = (List<ContactDto>) JSON.deserialize(
                    RestContextFacade.getRequestBody(),
                    List<ContactDto>.class
            );
            List<ContactDto> contactDtosWithIds = this.contactAppService.createContacts(contactDtos);

            RestContextFacade.setResponseBody(contactDtosWithIds);
        } catch (JSONException e) {
            throw new InvalidDataException('Invalid request payload.');
        }
    }
}