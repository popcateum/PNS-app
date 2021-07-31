<script>
  import Info from './Info.svelte'

  let myInfo = [
    {
      isType: false,
      title: 'My Account',
      defaultText: 'Please connect your wallet',
      value: null
    },
    {
      isType: false,
      title: 'My PNS',
      defaultText: 'No Nickname. Please enroll your PNS',
      value: null
    },
    {
      isType: true,
      title: 'Type your PNS',
      defaultText: 'Please type your PNS',
      value: null
    },
  ]
</script>

<div class="box">
  <div class="middleTitle">
    <b>Enroll PNS</b>
  </div>
  {#each myInfo as item}
    <Info isType={item.isType} title={item.title} defaultText={item.defaultText} value={item.value} />
  {/each}
</div>

<style lang="scss">
  @import '../styles/Box.scss';
</style>
