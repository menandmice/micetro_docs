.. meta::
   :description: Defining and adding custom properties used for entry of relevant data  
   :keywords: Micetro custom properties, Management Console
   
.. _console-admin-custom-properties:

Adding a Custom Property (Management Console, obsolete)
---------------------------------------------

1. From the menu bar, select :menuselection:`Tools --> Define Custom Properties`. The *Define Custom Properties* dialog box displays.

.. image:: ../../images/admin-custom-properties.png
  :width: 80%
  :align: center

2. Select the object type to which you want to add a custom property.

3. Click the :guilabel:`Add` button. The *Custom Property* dialog box displays.

.. image:: ../../images/admin-define-custom-property.png
  :width: 60%
  :align: center

4. Fill in the details:

  Name.
    Type a name for this custom property.

  Type.
    Set the type for the property. By default, "Text" is selected. Click the drop-down list and select the desired property type - e.g., Text, Yes/No, IP Address, or Number.

  Mandatory.
    When selected, a user must enter a value in this field. If you select this option, you cannot select "Read only."

  Read only.
    When selected, the field is locked for editing. If you select this option, you cannot select "Mandatory."

  Multiline.
    When selected, the edit field contains multiple lines for entry. If you select this option, you cannot select "List."

  Predefined Values.
    When selected, the field displays as a drop-down list. Click the checkbox for List. Then click the Edit List button. The Custom Property List Items dialog box through which you can add, edit, and remove custom properties displays.

    .. note::
      If you select this option, you cannot select "Multiline".

    * To ADD an item for this property, click Add. The Custom Property List Items dialog box displays.

    .. image:: ../../images/admin-custom-property-list.png
      :width: 60%
      :align: center

    * Type the item in the field provided.

    * Add any additional items. You can move items Up and/or Down in the list, as desired. This designates the order in which they appear in the list.

    * Then click :guilabel:`OK`. When you return to the *Custom Property List Items* dialog box, the items entered are shown.

    .. image:: ../../images/admin-custom-property-2.png
      :width: 60%
      :align: center

    * To edit/remove any values, click Edit List and make the necessary changes.

    * When all selections are made, click :guilabel:`OK`.

  Default value.
    Specifies the default field value to use when an object is created. This field is only a drop-down list if the 'List' checkbox is selected; otherwise, it is an edit field.

5. When all selections/entries are made, click :guilabel:`OK`. When you return to the *Define Custom Properties* dialog box, the new field is shown.

6. If there are multiple custom properties for an object, use the Move Up/Move Down arrows to change the order in which this display in the object window.

7. When all fields are added, click the :guilabel:`Save` button.

Editing a Custom Property (Management Console)
----------------------------------------------

To edit a custom property, do the following:

1. From the menu, select :menuselection:`Tools --> Define Custom Properties`.

2. Locate and highlight the property to be edited.

3. Click the :guilabel:`Edit` button.

4. Make the necessary changes.

5. Click :guilabel:`OK`.

Deleting a Custom Property (Management Console)
-----------------------------------------------

To delete a custom property, do the following:

1. From the menu, select :menuselection:`Tools --> Define Custom Properties`.

2. Locate and highlight the property to be deleted.

3. Click the :guilabel:`Delete` button.

4. When the confirmation message displays, click :guilabel:`Yes`.

5. Click :guilabel:`OK`.

Displaying a Custom Property (Management Console)
-------------------------------------------------

Once a custom property has been defined, it is possible to view and edit its contents by opening the Properties dialog for any object of the type for which the custom property has been defined.

Opening a Custom Property URL (Management Console)
--------------------------------------------------

Anytime you have specified a URL within a custom property, you can use this option to open the URL.

1. Locate the item containing the URL.

2. Right-click and, from the shortcut menu, select :guilabel:`Properties`.

3. In the *Properties* dialog box, move to the field containing the URL.

4. Place the cursor anywhere in the field and right-click.

5. From the shortcut menu, select :guilabel:`Open URL`.

.. image:: ../../images/admin-custom-property-url.png
  :width: 60%
  :align: center

6. Your browser will open and the web site for the URL displays.
