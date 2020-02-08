
server "3.115.27.147", user: "kouyama0201", roles: %w{web app db}, port: 22,

  ssh_options: {
    user: 'kouyama0201',
    keys: [File.expand_path('~/.ssh/tennis-notes_key_rsa')],
    forward_agent: true,
  }

