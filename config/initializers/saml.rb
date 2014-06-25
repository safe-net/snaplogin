SamlIdp.configure do |config|
  base = 'https://snaplogin.herokuapp.com'

  config.x509_certificate = <<-CERT
-----BEGIN CERTIFICATE-----
MIIDiDCCAnACCQDnOvORrBCk2jANBgkqhkiG9w0BAQUFADCBhTELMAkGA1UEBhMC
VVMxCzAJBgNVBAgTAk1EMREwDwYDVQQHEwhBYmluZ2RvbjESMBAGA1UEChMJU25h
cExvZ2luMSAwHgYDVQQDExdzbmFwbG9naW4uaGVyb2t1YXBwLmNvbTEgMB4GCSqG
SIb3DQEJARYRcnVzc0BzYWZlbW9uay5jb20wHhcNMTQwNjI1MTgxNTM1WhcNMTUw
NjI1MTgxNTM1WjCBhTELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAk1EMREwDwYDVQQH
EwhBYmluZ2RvbjESMBAGA1UEChMJU25hcExvZ2luMSAwHgYDVQQDExdzbmFwbG9n
aW4uaGVyb2t1YXBwLmNvbTEgMB4GCSqGSIb3DQEJARYRcnVzc0BzYWZlbW9uay5j
b20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDD9lpnB5VO7Ev8gKZ1
m7/E7S9aoYsv6+wrXThH7fwIaIEVF2pajPMRyNQtl9xJiSmKyXtPVqbWM8PZ0duo
Cew3YvGwHNAmakWiUMxD+fqfoAUCylFbmTy8vBpmeQjoRNm9XzfB2eRaZCrKIsik
Pad4v+Z2PdzSvLuNEDsedqgtO+yQIgUVzizWW0VdMXzh3vrXH3kfYLHKB46IznBJ
gVx3thOQGugWuKwpE5M9lnloatwmvbmZfR8ANEnb8kH/UrbhnUtr2Av1Xci8u/k2
pjq0oHxHI2v9VX/VVVIu2J4K+uEolvUZrcQKqx2HKIV7vDyomF/wUtlhnmHF4qIS
oC1tAgMBAAEwDQYJKoZIhvcNAQEFBQADggEBACzESpnlZbDRmTTiUfUXFATF3Inv
vLLb1QHlxqDjGA+6S5Vozf0LQ4Lgaai1fz2O7TA8mWG1386s9vIosSn1Fq6juh+v
ggBISrRhULLwaxpwtXMXRNzHjvyyZVo6zVock76vnLH3sSPVj1FfiVRzdKgnQ8t7
AwW5JYxPbk43RUTWOEpMMRaLEfxQL4pIy10osbn5pFTawur1Ju7yy0f9393MhYLM
0yzoKPwUiysFRU2n499DdXevH1fb3v+jqrMlX/dvi3F7rrN13AguVnvmCWHNV98u
FKxDd5+vEOpddsZ6LqJk6fZ9c4mXrizxMlFLHGtV5xYceccyXRFj+aTab4w=
-----END CERTIFICATE-----
  CERT

  config.secret_key = <<-CERT
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAw/ZaZweVTuxL/ICmdZu/xO0vWqGLL+vsK104R+38CGiBFRdq
WozzEcjULZfcSYkpisl7T1am1jPD2dHbqAnsN2LxsBzQJmpFolDMQ/n6n6AFAspR
W5k8vLwaZnkI6ETZvV83wdnkWmQqyiLIpD2neL/mdj3c0ry7jRA7HnaoLTvskCIF
Fc4s1ltFXTF84d761x95H2CxygeOiM5wSYFcd7YTkBroFrisKROTPZZ5aGrcJr25
mX0fADRJ2/JB/1K24Z1La9gL9V3IvLv5NqY6tKB8RyNr/VV/1VVSLtieCvrhKJb1
Ga3ECqsdhyiFe7w8qJhf8FLZYZ5hxeKiEqAtbQIDAQABAoIBAQDACtO5mKLoP4aQ
I/v90e7zrIX1yc6/3fMK5EZdp4qRKuklpFbj+rHTQf89109Y+YSusJmZvQ+vZ/eN
pa4gVekatmqo7vPGUeuAELK+A2Nrv8RpYaCtpdTyGV2+AuuJxL+maIQaA9FYDEYq
5j+/RXS0T0wpoKKiG7epnLhzOFHEUPTSe+gC+J2rmnEmKOeiNbvr0ds5Ne+tjuTm
0jNyEAcfeMu5RVOWPLzgzp+pS1DHJtJUsgJGcnoj1+orMxnL9cz+0FB3R/ieQ7ZV
4psWv7NjJr9vYUWSmrEraXwS9WU30gqB/iO84TVChlZDsoiYhPs9HYwicUfg+I23
R5D44g1BAoGBAP9b1S6zJeNENqi5MxnAtDvx/NjNc9Rn78VsDcFQVS35tgpjEoAn
xyQMBHLQl9orxhTkcKS2pwWnoS/747LA4V7INqM7+FHXOcVrc4cQcym+xtNYJ92p
7m5zcFCF54OXKPPdbmVQCuKotylBMgZM5iTrKY/Ig6pUSpzfo7ZD0BJlAoGBAMR0
Vcmw0aB4m9X6zpKpR+XxZZf2Fb2qSqsHFrj8I+Tl59IQ9bNbVd5xRpO0/hJZOW52
ZVHy2UkQb+fCfgCFCPsY4KtECHKX5sE/mQFp9QE+k65AD76u+27R7aZnhuTH9TeN
HW0S+0F58ydjftJ+GBe3NjEqPC5+NwEEChlA6vppAoGAYHScsvYigpT6nILQJZMf
wWDnpDD+5qWX8Reenn2snyAqvgOsMlJUK26Ko5/dLCDKwouDbQQ9VKp7/TcFTDkF
KBsyYDg/1RIaFVNAIS16grM4QQ6UiGsuz/O04gWibJdFddAXahdw9SrLfL7OmYik
ih915ITWDxml0Vm8ahV1W+0CgYAKVTAZ7qHn9dAEfi+VSTAN6Rd12aylECrjOfk4
+5ILvQfnZZr2twwaKg0TQcbHQkgiBjooCETjcejg4Lrt3hFt244dk/N5y4GIkobC
q0cGrLrpxFbPqbZxyrrcML/IkrfUFykADqqGdBqU7MfD3Hv561n/VgBaVasg84xw
bZiuWQKBgQDBmIZcgPp5vCRsMQJZcs8/k4JTC7s768p7eaoHUfEDCePbT3XZe/WV
ehSUvtU8bhxNtqYEcI7fDPCdq1RNJNP6gmkcPwFrJc1poN+k6zUC3fTd3MBgJ1w6
m5MMDrpDrRnn65G8FgfRQ1fK8dIM43BZYmC/UJ5xyFkAgPVXcO1m6g==
-----END RSA PRIVATE KEY-----
  CERT

  # config.password = "secret_key_password"
  # config.algorithm = :sha256
  config.organization_name = 'SnapLogin'
  # config.organization_url = 'http://example.com'
  config.base_saml_location = "#{base}/saml"
  # config.reference_id_generator                   # Default: -> { UUID.generate }
  config.attribute_service_location = "#{base}/saml/attributes"
  config.single_service_post_location = "#{base}/saml/auth"

  # Principal is passed in when you `encode_response`
  #
  config.name_id_formats =
    {                         # All 2.0
      email_address: -> (principal) { principal.email },
      transient: -> (principal) { principal.persistence_token },
      persistent: -> (p) { p.persistence_token },
    }
  #   OR
  #
  #   {
  #     "1.1" => {
  #       email_address: -> (principal) { principal.email_address },
  #     },
  #     "2.0" => {
  #       transient: -> (principal) { principal.email_address },
  #       persistent: -> (p) { p.id },
  #     },
  #   }

  # config.attributes # =>
  #   {
  #     <friendly_name> => {                                                  # required (ex "eduPersonAffiliation")
  #       "name" => <attrname>                                                # required (ex "urn:oid:1.3.6.1.4.1.5923.1.1.1.1")
  #       "name_format" => "urn:oasis:names:tc:SAML:2.0:attrname-format:uri", # not required
  #       "getter" => ->(principal) {                                         # not required
  #         principal.get_eduPersonAffiliation                                # If no "getter" defined, will try
  #       }                                                                   # `principal.eduPersonAffiliation`, or no values will
  #    }                                                                      # be output
  #
  # EXAMPLE ##
  config.attributes = {
    GivenName: {
      getter: :name,
    },
  #   SurName: {
  #     getter: :last_name,
  #   },
  }
  ## EXAMPLE ##

  # config.technical_contact.company = "Example"
  # config.technical_contact.given_name = "Jonny"
  # config.technical_contact.sur_name = "Support"
  # config.technical_contact.telephone = "55555555555"
  # config.technical_contact.email_address = "example@example.com"

  service_providers = {
      'some-issuer-url.com/saml' => {
          fingerprint: '9E:65:2E:03:06:8D:80:F2:86:C7:6C:77:A1:D9:14:97:0A:4D:F4:4D',
          metadata_url: 'http://some-issuer-url.com/saml/metadata'
      },
      'Dropbox' => {

      }
  }

  # `identifier` is the entity_id or issuer of the Service Provider,
  # settings is an IncomingMetadata object which has a to_h method that needs to be persisted
  config.service_provider.metadata_persister = ->(identifier, settings) {
    fname = identifier.to_s.gsub(/\/|:/, '_')
    `mkdir -p #{Rails.root.join('cache/saml/metadata')}`
    File.open Rails.root.join("cache/saml/metadata/#{fname}"), 'r+b' do |f|
      Marshal.dump settings.to_h, f
    end
  }

  # `identifier` is the entity_id or issuer of the Service Provider,
  # `service_provider` is a ServiceProvider object. Based on the `identifier` or the
  # `service_provider` you should return the settings.to_h from above
  config.service_provider.persisted_metadata_getter = ->(identifier, service_provider){
    fname = identifier.to_s.gsub(/\/|:/, '_')
    `mkdir -p #{Rails.root.join('cache/saml/metadata')}`
    fileName = Rails.root.join("cache/saml/metadata/#{fname}")
    if File.exist? fileName
      File.open fileName, 'rb' do |f|
        Marshal.load f
      end
    end
  }

  # Find ServiceProvider metadata_url and fingerprint based on our settings
  config.service_provider.finder = ->(issuer_or_entity_id) do
    service_providers[issuer_or_entity_id]
  end
end