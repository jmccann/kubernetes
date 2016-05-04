#
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
# Authors:  Andre Elizondo (andre@chef.io)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'selinux::disabled' if node[:platform_family].eql? 'rhel'

# Install docker for the first time, later manage by providers
docker_service 'kubernetes' do
  action [:create, :start]
  retries 5
  not_if '[ -e /etc/systemd/system/docker-kubernetes.service ]'
end
