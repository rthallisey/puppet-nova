# == Class: nova::ironic
#
# Configures Nova bare-metal to use Ironic.
#
# === Parameters:
#
# [*admin_user*]
#   Admin username
#   The admin username for Ironic to connect to Nova.
#   Defaults to 'admin'
#
# [*admin_passwd*]
#   Admin password
#   The admin password for Ironic to connect to Nova.
#   Defaults to 'ironic'
#
# [*admin_url*]
#   Admin url
#   The address of the Keystone api endpoint.
#   Defaults to 'http://127.0.0.1:35357/v2.0'
#
# [*admin_tenant_name*]
#   Admin tenant name
#   The Ironic Keystone tenant name.
#   Defaults to 'services'
#
# [*api_endpoint*]
#   Api endpoint
#   The url for Iroinc api endpoint.
#   Defaults to '0'
#
# [*reserved_host_memory*]
#   Resereved host memory
#   The amount of memory in MB of reserved for the host.
#   Defaults to '0'
#

class nova::ironic (
  $admin_user = 'admin',
  $admin_passwd = 'ironic',
  $admin_url = 'http://127.0.0.1:35357/v2.0',
  $admin_tenant_name = 'services'
  $api_endpoint = 'services'
  $reserved_host_memory = '0'
) {

  if $admin_user {
    nova_config {'IRONIC/admin_username': value => $admin_user }
  }
  if $admin_passwd {
    nova_config {'IRONIC/admin_password': value => $admin_passwd }
  }
  if $admin_url {
    nova_config {'IRONIC/admin_url': value => $admin_url }
  }
  if $admin_tenant_name {
    nova_config {'IRONIC/admin_tenant_name': value => $admin_tenant_name  }
  }
  if $api_endpoint {
    nova_config {'IRONIC/api_endpoint': value => $api_endpoint  }
  }
  if $reserved_host_memory  {
    nova_config {'DEFAULT/reserved_host_memory_mb ': value => $reserved_host_memory }
  }

  "ironic/admin_username": value => "%(CONFIG_NEUTRON_KS_PW)s",
    "ironic/admin_password": value => "%(CONFIG_NEUTRON_KS_PW)s",
    "ironic/admin_url": value => "http://%(CONFIG_CONTROLLER_HOST)s:35357/v2.0",
    "ironic/admin_tenant_name": value => "services",
    "ironic/api_endpoint": value => "http://IRONIC_NODE:6385/v1",
  


  nova_config {
    'DEFAULT/compute_driver':          value => 'nova.virt.ironic.IronicDriver';
    'DEFAULT/compute_manager':         value => 'ironic.nova.compute.manager.ClusteredComputeManager';
  }
}
