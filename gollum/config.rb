# Example gollum config with omnigollum authentication
# gollum ../wiki --config config.rb
#
# or run from source with
#
# bundle exec bin/gollum ../wiki/ --config config.rb

# Remove const to avoid
# warning: already initialized constant FORMAT_NAMES
#
# only remove if it's defined.
# constant Gollum::Page::FORMAT_NAMES not defined (NameError)
Gollum::Page.send :remove_const, :FORMAT_NAMES if defined? Gollum::Page::FORMAT_NAMES
# limit to one format
Gollum::Page::FORMAT_NAMES = { :markdown  => "Markdown" }

=begin
Valid formats are:
{ :markdown  => "Markdown",
  :textile   => "Textile",
  :rdoc      => "RDoc",
  :org       => "Org-mode",
  :creole    => "Creole",
  :rest      => "reStructuredText",
  :asciidoc  => "AsciiDoc",
  :mediawiki => "MediaWiki",
  :pod       => "Pod" }
=end

# Specify the path to the Wiki.
gollum_path = '/home/site/wwwroot'
Precious::App.set(:gollum_path, gollum_path)

# Specify the wiki options.
wiki_options = {
  :live_preview => true,
  :allow_uploads => true,
  :allow_editing => true
}
Precious::App.set(:wiki_options, wiki_options)

# Set as Sinatra environment as production (no stack traces)
Precious::App.set(:environment, :production)

# Setup Omniauth via Omnigollum.
require 'omnigollum'
require 'omniauth-azure-activedirectory'

options = {
  # OmniAuth::Builder block is passed as a proc
  :providers => Proc.new do
      provider :azure_activedirectory, ENV['AAD_CLIENT_ID'], ENV['AAD_TENANT']
  end,
  :dummy_auth => false,
  # Make the entire wiki private
  :protected_routes => ['/*'],
  # Specify committer name as just the user name
  :author_format => Proc.new { |user| user.name },
  # Specify committer e-mail as just the user e-mail
  :author_email => Proc.new { |user| user.email },
  :authorized_users => nil
}

# :omnigollum options *must* be set before the Omnigollum extension is registered
Precious::App.set(:omnigollum, options)
Precious::App.register Omnigollum::Sinatra
