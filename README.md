SFDC_ActionPlans
================

Action Plans helps your organization encapsulate best practices into easily sharable, reusable task templates.

You can create Action Plans for the following objects (varies by edition):
  * Accounts (PE, EE, UE, DE)
  * Contacts (PE, EE, UE, DE)
  * Leads (PE, EE, UE, DE)
  * Opportunities (PE, EE, UE, DE)
  * Campaigns (EE, UE, DE)
  * Contracts (EE, UE, DE)
  * Cases (EE, UE, DE)
  * Person Accounts (EE, UE, DE)

### Getting Help
Action Plans is Unsupported. For community assistance with Action Plans, please visit Salesforce Answers. To submit ideas or issues, please visit Action Plans on Github.

### Community
Action Plans is Open Source software. We welcome your issue reports, ideas, documentation, code tweaks and all other participation. Learn more.

### Considerations:
  * Action Plans can include up to 75 tasks and you can create up to 40 plans at a time.
  * Export and share your Action Plan Templates with other orgs.
  * Import Action Plan Templates provided by colleagues and vendors.
  * Supports task reminder times.
  * Action Plans Settings controls behavior around Chatter Brag and default task assignment behavior
  * Ability to delete up to 65 Action Plans at a time.


Installation
------------
<b>Prerequisites:</b> Apache Ant

  1. Clone this repo to your computer
  2. Open a terminal at the repo root
  3. Run: `ant deploy` and fill out the required deploy URL, username and password

Post Install Configuration
--------------------------

Getting started is easy. For each object, you need to add a button to the list view, add a button to the detail page. For Accounts, follow these steps:

### Update Your Action Plans Settings
  1. Navigate to Setup > Develop > Custom Settings. 
  2. Click on 'Manage' next to 'Action Plans Settings'. 
  3. Click the 'New' button near 'Default Organizational Level Value'. 
  4. Check the values that you want to enable.;
  5. Enable Chatter Object places a '[Username] has created an Action Plan' in the related objects Chatter Feed. If unchecked, Action Plans does not create a Feed Post.;
  6. 'Unassigned Task Defaults to Record Owner' ensure that Action Plan Template tasks with a blank 'Assigned To' goes to the related record's owner. If unchecked, tasks with a blank 'Assigned To' are assigned to the running user."

### Update Your Page & Search Layout Configuration
No explanation required (I hope)

### Create Action Plans Button
For each object, you need to add a button to the list view, For Accounts, follow these steps:
  1. Navigate to Setup > Customize > Accounts > Search Layouts.
  2. Click on "Edit" near "Accounts List View".
  3. Move the "Create Account Action Plans" button from "Available Buttons" to "Selected Buttons".
  4. Click "Save".
  5. Navigate to Setup > Customize > Accounts > Page Layouts. Note: the package includes a default "Action Plan Layout" for your reference. You do not need to use it.
  6. Click on "Edit" near one of your standard Account Page Layouts.
  7. Add "Action Plans" related list to the page.
  8. Edit the properties of the related list by clicking the configuration button above it.
  9. Expand "Buttons" section, unmark "New" checkbox and move "Create Account Action Plan" to the Selected buttons.
  10. Update the fields in the related list to meet your needs. Recommended fields include Start Date, Overall Task Status, Owner First Name, Owner Last Name.
  11. Click "Save".

Repeat these steps for the other objects Action Plans supports: Contacts, Leads, Opportunities, etc.

### Delete Action Plans Button
Follow this steps for Action Plan Object:
  1. Navigate to Setup > Create> Objects > Action Plans > Page Layouts.
  2. Click on "Edit" near "Action Plans List View".
  3. Move the "Delete Action Plans" button from "Available Buttons" to "Selected Buttons".
  4. Click "Save".

Repeat these steps for the other objects Action Plans supports: Contacts, Leads, Opportunities, etc.

### Update Your Sharing Settings
  1. Action Plans includes four objects: Action Plan, Action Plan Template, AP Task and APT Task. You can configure your sharing settings in whatever way works for your organization.
  2. If you want anyone to be able to create and see plans and their templates, use Public Read/Write for Action Plan and Action Plan Template.
  3. If you want people to be able to see Action Plans and Templates without being able to change them, select "Public Read Only".

Please note that if you set your Action Plan Template object to private, templates will not be visible outside of other sharing rules you might set up. This may make Action Plans somewhat less useful.


### Update Your Profiles
  * Users who will use Action Plans require the following permissions on their profile:
  * Custom Object Permissions: Read, Create, Edit and Delete for Action Plans, Action Plan Templates, AP Tasks and APT Task Templates. Note that if you have a profile that will "read" but not "edit" or "create" templates, you can make Action Plan Templates and APT Tasks Templates read only.
  * Tab Settings: About Action Plans, Action Plans and Import Template should be "Default On". Note that if you have a set of users who should not import templates, "Import Template" can be set to "Tab Hidden".
  * Custom App Settings: Action Plans should be visible.
  * Enabled Apex Class Access: All Apex classes from the Action Plans AppExchange package must be enabled.
  * Enabled Visualforce Page Access: All Visualforce pages from the Action Plans AppExchange package must be enabled.
