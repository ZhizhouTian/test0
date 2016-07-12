target remote :1235

define getmapping
	set var $page = $arg0
	print ((struct page*)$page)->mapping
end

define getpageflags
	set $flags = $arg0->flags

	echo flags:\t

	if $flags & 1 << 0
		echo PG_locked |  
	end
	if $flags & 1 << 1
		echo PG_error |  
	end
	if $flags & 1 << 2
		echo PG_referenced |  
	end
	if $flags & 1 << 3
		echo PG_uptodate |  
	end
	if $flags & 1 << 4
		echo PG_dirty or PG_savepinned |  
	end
	if $flags & 1 << 5
		echo PG_lru |  
	end
	if $flags & 1 << 6
		echo PG_active |  
	end
	if $flags & 1 << 7
		echo PG_slab |  
	end
	if $flags & 1 << 8
		echo PG_owner_priv_1 or PG_checked or PG_pinned or PG_isolated |
	end
	if $flags & 1 << 9
		echo PG_arch_1 |  
	end
	if $flags & 1 << 10
		echo PG_reserved |  
	end
	if $flags & 1 << 11
		echo PG_private or PG_slob_free |  
	end
	if $flags & 1 << 12
		echo PG_private_2 or PG_checked |  
	end
	if $flags & 1 << 13
		echo PG_writeback |  
	end
	if $flags & 1 << 14
		echo PG_head |  
	end
	if $flags & 1 << 15
		echo PG_tail |  
	end
	if $flags & 1 << 16
		echo PG_swapcache |  
	end
	if $flags & 1 << 17
		echo PG_mappedtodisk |  
	end
	if $flags & 1 << 18
		echo PG_reclaim or PG_movable |  
	end
	if $flags & 1 << 19
		echo PG_swapbacked |  
	end
	if $flags & 1 << 20
		echo PG_unevictable |  
	end
	if $flags & 1 << 21
		echo PG_mlocked |  
	end
	echo \n
end
