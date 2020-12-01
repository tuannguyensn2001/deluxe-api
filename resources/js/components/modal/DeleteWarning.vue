<template>
    <div class="modal fade" id="deleteWarning" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content ">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> {{ title }} </h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    {{ content  }}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="button"
                            class="btn btn-primary"
                            data-dismiss="modal"
                            @click="confirm"
                    >{{ action }}</button>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
    export default{
        props:{
            title: String,
            content: String,
            action: String,
        },
        methods:{
            confirm(){
                this.$emit('confirm');
            }
        }

    }
</script>
