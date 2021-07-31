<script>
  import Info from './Info.svelte'

  let myInfo = [
    {
      isType: false,
      title: 'My account',
      defaultText: 'Please connect your wallet',
      value: null
    },
    {
      isType: false,
      title: 'My nickname',
      defaultText: 'Please register your nickname',
      value: null
    },
    {
      isType: true,
      title: 'Type your nickname',
      defaultText: 'Please type your nickname',
      value: null
    },
  ]
</script>

<div class="box">
  <div class="middleTitle">
    <b>Register PNS</b>
  </div>
  {#each myInfo as item}
    <Info isType={item.isType} title={item.title} defaultText={item.defaultText} value={item.value} />
  {/each}
</div>

<style lang="scss">
  @import '../styles/Box.scss';
</style>
