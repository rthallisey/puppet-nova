# == Class: nova::compute::ironic
#
# Configures Nova compute service to use Ironic.
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
#   The url for Ironic api endpoint.
#   Defaults to 'http://127.0.0.1:6385/v1'
#
# [*reserved_host_memory*]
#   Reserved host memory
#   The amount of memory in MB reserved for the host.
#   Defaults to '0'
#

class nova::compute::ironic (
  $admin_user           = 'admin',
  $admin_passwd         = 'ironic',
  $admin_url            = 'http://127.0.0.1:35357/v2.0',
  $admin_tenant_name    = 'services',
  $api_endpoint         = 'http://127.0.0.1:6385/v1',
  $reserved_host_memory = '0'
) {

  nova_config {
    'ironic/admin_username':            value => $admin_user;
    'ironic/admin_password':            value => $admin_passwd;
    'ironic/admin_url':                 value => $admin_url;
    'ironic/admin_tenant_name':         value => $admin_tenant_name;
    'ironic/api_endpoint':              value => $api_endpoint;
    'DEFAULT/reserved_host_memory_mb':  value => $reserved_host_memory;
    'DEFAULT/compute_driver':           value => 'nova.virt.ironic.IronicDriver';
    'DEFAULT/compute_manager':          value => 'ironic.nova.compute.manager.ClusteredComputeManager';
  }
}
