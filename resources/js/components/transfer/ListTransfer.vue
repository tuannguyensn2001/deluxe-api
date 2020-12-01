<template>

    <div class="container">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Người gửi</th>
                <th scope="col">Người nhận</th>
                <th scope="col">Số tiền</th>
                <th scope="col">Lời nhắn</th>
                <th scope="col">Thời gian</th>
            </tr>
            </thead>
            <tbody>
            <tr
            v-for="(transfer,index) in listTransfer"
            >
                <th scope="row"> {{ index +1 }} </th>
                <td> {{ transfer.emailDepositor }} </td>
                <td>{{ transfer.emailReceiver }} </td>
                <td>{{ transfer.money }} </td>
                <td>{{ transfer.messages }} </td>
                <td>{{ transfer.created_at }} </td>
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
                ref:{},
                listTransfer:[],
            }
        },
        created()
        {
            this.ref = firebase.database().ref('transfer');
            this.ref.on('value',this.init);
        },
        methods:{
            init(snapshot)
            {
                const data = snapshot.val();
                for(let key in data){
                    const transfer = data[key];
                    transfer.key = key;
                    this.listTransfer.push(transfer);
                }
                this.listTransfer.reverse();
            }
        }
    }
</script>
