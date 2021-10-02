import consumer from '../consumer'

const ProductChannel = consumer.subscriptions.create(
  { channel: "ProductChannel" }
)

export default ProductChannel
