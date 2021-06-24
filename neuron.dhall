-- Documentation for neuron.dhall: https://neuron.zettel.page/configuration
{ siteTitle = "Arch Linux Notes"
, author = Some "Daniel Kahlenberg"
, siteBaseUrl = Some "https://573.github.io/arch-linux-notes/"
-- List of color names: https://semantic-ui.com/usage/theming.html#sitewide-defaults
, theme = "teal"
-- This is used in the "edit" button
, editUrl = Some "https://github.com/573/arch-linux-notes/edit/master/"
, plugins = [ "neuronignore", "links", "uptree", "feed" ,"tags"]
}
