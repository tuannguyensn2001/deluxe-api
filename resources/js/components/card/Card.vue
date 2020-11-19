<template>
<!--  <b-button variant="danger">Button</b-button>-->
  <div>
    tuan
  </div>
</template>

<script>
  import firebase from 'firebase'
  export default{
    created() {
      let cardRef = firebase.database().ref('card');

      cardRef.on('value',snapshot=>{
        const cardList = snapshot.val();
        console.log(this.convert(cardList));

      })
    },
    methods:{
      convert(list){
        let result = [];

        for(let i in list){
          list[i]['key'] = i;
          result.push(list[i]);
        }

        return result;
      }
    },

  }
</script>