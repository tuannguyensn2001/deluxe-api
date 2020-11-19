<template>
  <router-link
      :to="link"
      class="mdc-list-item "
      aria-current="page"
  >
    <span class="mdc-list-item__ripple"></span>
    <i
        class="material-icons mdc-list-item__graphic"
        aria-hidden="true"
    > {{ icon }} </i
    >
    <span class="mdc-list-item__text"> {{ name }} </span>
  </router-link>
</template>


<script>
  export default{
    props:{
      name: String,
      icon: String,
      link: String,
    }

  }
</script>