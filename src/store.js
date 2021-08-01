import { readable, writable } from 'svelte/store'

export const myAddress = writable(null)
export const myNickname = writable(null)
export const inputNickname = writable(null)

export const isConnect = writable(false)
export const provider = writable(null)
export const signer = writable(null)
export const myFullAddress = writable(null)

export const contractAddress = readable('0x1149dBA023cEe0d895Ad19060D91bfe28954dEBd')
