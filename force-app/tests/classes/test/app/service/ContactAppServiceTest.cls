@IsTest
private class ContactAppServiceTest {
    @IsTest
    private static void testGetContact() {
        Id mockContactId = SObjectTestUtil.generateId(Contact.SObjectType);

        Contact mockContact = new Contact();
        mockContact.Id = mockContactId;
        mockContact.FirstName = 'Unit';
        mockContact.LastName = 'Test';

        GenericSelectorMock.createAndPassMockToDependencyInjector(ContactSelector.class);
        GenericSelectorMock.mockResult = mockContact;

        Test.startTest();
        ContactAppService service = new ContactAppService();
        ContactDto contactDto = service.getContact(mockContactId);
        Test.stopTest();

        Assert.areEqual(mockContact.Id, contactDto.id);
        Assert.areEqual(mockContact.FirstName, contactDto.firstname);
        Assert.areEqual(mockContact.LastName, contactDto.lastname);
    }
}