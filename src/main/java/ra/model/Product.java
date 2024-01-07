package ra.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="product")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Product {
    @Id
    @Column(name="product_id",columnDefinition = "char(5)")
    private String id;
    @Column(name="product_name",columnDefinition = "varchar(100)",nullable = false,unique = true)
    private String name;
    private float price;
    @Column(columnDefinition = "varchar(200)")
    private String quantity;
    @Column(columnDefinition = "varchar(200)")
    private String description;
    //Chứa link ảnh đại diện sản phẩm được upload trên firebase
    @Column(name="avatar_image",columnDefinition = "text")
    private String avatarImage;
    @Column(name="product_status")
    private boolean status;
    @ManyToOne
    @JoinColumn(name="catalog_id",referencedColumnName = "catalog_id")
    private Categories catalog;
    @OneToMany(mappedBy = "product",fetch = FetchType.EAGER)
    private List<Images> listImages = new ArrayList<>();
}
