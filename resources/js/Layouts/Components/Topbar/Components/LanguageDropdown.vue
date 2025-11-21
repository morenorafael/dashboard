<script setup lang="ts">
import { Link } from '@inertiajs/vue3';
</script>

<template>
  <div class="topbar-item hs-dropdown [--placement:bottom-right] relative inline-flex">
    <button class="hs-dropdown-toggle btn btn-icon size-8 hover:bg-default-150 rounded-full relative" type="button" aria-haspopup="menu" aria-expanded="false" aria-label="Dropdown">
      <img src="../../../../../images/flags/us.jpg" alt="" class="size-4.5 rounded" />
    </button>
    <div class="hs-dropdown-menu" role="menu" aria-orientation="vertical" aria-labelledby="dropdown-menu">
      <Link class="flex items-center gap-x-3.5 py-1.5 font-medium px-3 text-default-600 hover:bg-default-150 rounded" href="">
        <img src="../../../../../images/flags/us.jpg" alt="" class="size-4 rounded-full" />
        English
      </Link>
      <Link class="flex items-center gap-x-3.5 py-1.5 font-medium px-3 text-default-600 hover:bg-default-150 rounded" href="">
        <img src="../../../../../images/flags/spain.jpg" alt="" class="size-4 rounded-full" />
        Spanish
      </Link>
      <Link class="flex items-center gap-x-3.5 py-1.5 font-medium px-3 text-default-600 hover:bg-default-150 rounded" href="">
        <img src="../../../../../images/flags/germany.jpg" alt="" class="size-4 rounded-full" />
        German
      </Link>
      <Link class="flex items-center gap-x-3.5 py-1.5 font-medium px-3 text-default-600 hover:bg-default-150 rounded" href="">
        <img src="../../../../../images/flags/french.jpg" alt="" class="size-4 rounded-full" />
        French
      </Link>
      <Link class="flex items-center gap-x-3.5 py-1.5 font-medium px-3 text-default-600 hover:bg-default-150 rounded" href="">
        <img src="../../../../../images/flags/japanese.svg" alt="" class="size-4 rounded-full" />
        Japanese
      </Link>
      <Link class="flex items-center gap-x-3.5 py-1.5 font-medium px-3 text-default-600 hover:bg-default-150 rounded" href="">
        <img src="../../../../../images/flags/italy.jpg" alt="" class="size-4 rounded-full" />
        Italian
      </Link>
      <Link class="flex items-center gap-x-3.5 py-1.5 font-medium px-3 text-default-600 hover:bg-default-150 rounded" href="">
        <img src="../../../../../images/flags/russia.jpg" alt="" class="size-4 rounded-full" />
        Russian
      </Link>
      <Link class="flex items-center gap-x-3.5 py-1.5 font-medium px-3 text-default-600 hover:bg-default-150 rounded" href="">
        <img src="../../../../../images/flags/arebian.svg" alt="" class="size-4 rounded-full" />
        Arabic
      </Link>
    </div>
  </div>
</template>
