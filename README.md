# cblamp1-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['cblamp1']</tt></td>
    <td>Boolean</td>
    <td>Creates 2 VM node mysql ndb cluster, one VM with Apache and PHP</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### cblamp1::default

Include `cblamp1` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[cblamp1::default]"
  ]
}
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
