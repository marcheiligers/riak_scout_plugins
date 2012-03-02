# Copyright (c) 2011 Mad Mimi, LLC
# Marc Heiligers (marc@madmimi.com)
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
# and associated documentation files (the "Software"), to deal in the Software without restriction, 
# including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
# and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial 
# portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT 
# LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

class RiakPlugin < Scout::Plugin
  needs 'net/http'
  needs 'json'
  
  OPTIONS = <<-EOF
    stats_collection:
      default: pbc_active,pbc_connects,coord_redirs_total,executing_mappers,node_gets,node_get_fsm_time_95,node_get_fsm_time_99,node_get_fsm_time_100,node_puts,node_put_fsm_time_95,node_put_fsm_time_99,node_put_fsm_time_100,vnode_puts,vnode_gets,vnode_index_reads,vnode_index_writes,vnode_index_writes_postings,vnode_index_deletes,vnode_index_deletes_postings,read_repairs
      name: Stats to collect
      notes: A comma separated list of the stats to collect. This has a maximum of 20 entries, additional entries will be ignored. 
    stats_url:
      default: 'http://localhost:8098/stats'
      name: Stats URL
      notes: The url that the plugin will hit to get the JSON stats document from Riak.
  EOF
  
  def build_report
    response = Net::HTTP.get_response URI.parse(option(:stats_url))
    json = JSON.parse response.body
    
    result = {}
    option(:stats_collection).split(',')[0..19].map(&:strip).each do |name|
      result[name] = json[name] if json[name]
    end
    
    report result
  end
    
end