<script>
  import Header from './components/Header.svelte'
  import Notice from './components/Notice.svelte'
  import Enroll from './components/Enroll.svelte'
  import Button from './components/EnrollBtn.svelte'
</script>

<Header />
<div class="container">
  <Notice />
  <Enroll />
  <Button />
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
