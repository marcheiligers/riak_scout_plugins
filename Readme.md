# Riak Scout Plugins

This represents a basic Riak Scout Plugin. By default it reports on:

- pbc_active
- pbc_connects
- coord_redirs_total
- executing_mappers
- node_gets
- node_get_fsm_time_95
- node_get_fsm_time_99
- node_get_fsm_time_100
- node_puts
- node_put_fsm_time_95
- node_put_fsm_time_99
- node_put_fsm_time_100
- vnode_puts
- vnode_gets
- vnode_index_reads
- vnode_index_writes
- vnode_index_writes_postings
- vnode_index_deletes
- vnode_index_deletes_postings
- read_repairs

There is a configuration option to change the metrics reported on if your needs are different.

By default the plugin hits http://localhost:8098/stats for Riak metrics. Again, there is a 
configuration option to change this url.

We (http://madmimi.com) run this in production on Riak 1.0.3.

## Future

Because Scout limits the number of reported values per plugin to 20, the intention is to create 
several plugins with different defaults covering the many metrics that Riak is able to report
by category. 

## License

Copyright (c) 2011-2012 Mad Mimi, LLC
Marc Heiligers (marc@madmimi.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
and associated documentation files (the "Software"), to deal in the Software without restriction, 
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial 
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT 
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
