<script>
  import Header from './components/Header.svelte'
  import Notice from './components/Notice.svelte'
  import RegisterForm from './components/RegisterForm.svelte'
  import RegisterBtn from './components/RegisterBtn.svelte'
</script>

<Header />
<div class="container">
  <Notice />
  <RegisterForm />
  <RegisterBtn />
</div>

<style lang="scss">
  .container {
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    align-items: center;
    justify-content: center;
  }

</style>
