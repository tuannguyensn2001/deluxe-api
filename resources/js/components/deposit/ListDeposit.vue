<template>
    <div class="container">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Email</th>
                <th scope="col">Số tiền</th>
                <th scope="col">Thời gian</th>
            </tr>
            </thead>
            <tbody>
            <tr
            v-for="(deposit,index) in listDeposit"
            >
                <th scope="row"> {{ index+1 }} </th>
                <td> {{ deposit.email }} </td>
                <td> {{ deposit.money }} </td>
                <td> {{ deposit.created_at }} </td>
            </tr>
            </tbody>
        </table>
    </div>

</template>


<script>
import firebase from 'firebase';
    export default{
        data(){
            return{
                listDeposit:[],
                ref:{},
            }
        },
        created()
        {
            this.ref = firebase.database().ref('deposit');
            this.ref.on('value',this.init);
        },
        methods:{
            init(snapshot)
            {
                const data = snapshot.val();
                for(let key in data)
                {
                    const deposit = data[key];
                    deposit.key = key;
                    this.listDeposit.push(deposit);
                }
            }
        }
    }
</script>
