# Roadmap: group-theoretic matrix multiplication

**Summary.** Cohn and Umans proposed to multiply matrices inside the group algebra of a finite
group. Three subsets `S`, `T`, `U` of a group have the triple product property when an equation
`s' s⁻¹ · t' t⁻¹ · u' u⁻¹ = 1` with `s, s' ∈ S`, `t, t' ∈ T`, `u, u' ∈ U` holds only with
`s' = s`, `t' = t` and `u' = u`; the group then realizes `⟨|S|, |T|, |U|⟩`. Matrix products can be
read off products in the group algebra, and the group algebra is a product of matrix algebras
whose sizes `d₁, …, d_q` are the sizes of its Wedderburn blocks. This roadmap proves the resulting
bound on the exponent `ω` of matrix multiplication and the two classical constructions of groups
with the property. Tensors, their rank and `ω` are those of AsymptoticSpectra, over a field `F`;
the group algebra enters through a presentation `F[G] ≅ Mat_{d₁}(F) × ⋯ × Mat_{d_q}(F)`, given
as data.

The headline theorems are these.

- *The Cohn–Umans bound.* Over any field `F`, if `F[G]` has such a presentation and `G` realizes
  `⟨n, m, p⟩`, then `(n m p)^(ω/3) ≤ d₁^ω + ⋯ + d_q^ω`, where `ω` is the exponent over `F`. On
  the way, a group that realizes `⟨n, n, n⟩` has the `n × n` matrix multiplication tensor as a
  restriction of its multiplication tensor, and a presentation makes that tensor equivalent to
  the direct sum of the `d_i × d_i` matrix multiplication tensors.
- *Constructions.* The three subgroups of permutations of the triangular array of side `n` that
  preserve one barycentric coordinate have the triple product property, each of order
  `1! 2! ⋯ n!`. In the group `((ℤ/n)³ × (ℤ/n)³) ⋊ C₂` of order `2n⁶` of Cohn, Kleinberg, Szegedy
  and Umans, explicit sets of size `2n(n − 1)` have it.
- *Beating the sum of the cubes.* Over an algebraically closed field every block size is at most
  the index of any abelian subgroup. Hence for the second construction the cubes of the block
  sizes sum to at most `4n⁶`, which is less than `(2n(n − 1))³` for `n ≥ 5`.

The tensors, restriction, tensor rank, the square matrix multiplication tensor and the exponent
`ω` with `2 ≤ ω ≤ log₂ 7` are those of AsymptoticSpectra, whose definitions are copied and whose
Strassen preorder and rank theorems carry the bound. Tau Ceti's character-table library supplies
a presentation over an algebraically closed field whose characteristic does not divide the order
of the group, the sum of squares `d₁² + ⋯ + d_q² = |G|`, and the irreducible representations on
the blocks used for block sizes.

Layer 1 is group theory: the triple product property, its basic laws and the two constructions.
Layer 2 builds the group tensor, embeds matrix multiplication into it, decomposes it along a
presentation, and proves the bound. Layer 3 bounds block sizes by abelian subgroups and applies
this to the second construction.

## Conventions

- **Groups and quotients.** The right quotient set of a subset `S` of a group is
  `Q(S) = {s' s⁻¹ : s, s' ∈ S}` (Cohn and Umans). `IsTPP S T U` is the triple product property
  with right quotients, written out on elements, so no quotient set is formed; `Realizes G n m p`
  asks for finite subsets (`Finset G`) of sizes `n`, `m`, `p` with it. An empty subset makes the
  property vacuous, so a finite group realizes `⟨0, m, p⟩` for `m, p ≤ |G|`; every statement
  below is true with these values. For subgroups, `Q(H) = H`.
- **Tensors.** `CoordTensor F (Fin 3)` with its sum (block direct sum), Kronecker product,
  restriction `restrictLE` and tensor rank `tensorRank` (CP rank), the matrix multiplication tensor
  `mmTensor F n` (coordinate `1` exactly at `((i, j), (j, k), (k, i))`, indices read by
  `Fin.divNat` and `Fin.modNat`) and the exponent `matMulExponent F` are copied verbatim from
  AsymptoticSpectra 3.1 and 3.3. `ω` always means `matMulExponent F` for the field `F` at hand. By
  AsymptoticSpectra 3.3, `2 ≤ ω ≤ log₂ 7` over every field; as Lean's `sInf` of an empty set or of
  a set unbounded below in `ℝ` is `0`, this shows that the defining set of `ω` is nonempty and
  bounded below, so `ω` is a true infimum.
- **The group tensor.** For a finite group `G`, `groupTensor F G` has dimension `|G|` at each of
  the three parties, indices read as group elements through `Fintype.equivFin G`, and coordinate
  `1` at `(a, b, c)` exactly when `a b c = 1`. This cyclic form matches the cyclic form of
  `mmTensor`. It is the structure tensor `[a b = c]` of `MonoidAlgebra F G` in the basis of group
  elements with the third party relabelled by `c ↦ c⁻¹`; likewise `mmTensor F d` is the structure
  tensor `[E_ij E_jk = E_ik]` of `Matrix (Fin d) (Fin d) F` in its matrix units with the third
  party relabelled by `(i, k) ↦ (k, i)`. Relabelling a party by a bijection gives an equivalent
  tensor (restriction both ways by permutation matrices), so a different enumeration of `G` gives
  an equivalent group tensor.
- **Wedderburn presentations** are algebra equivalences
  `e : MonoidAlgebra F G ≃ₐ[F] Π i : Fin q, Matrix (Fin (d i)) (Fin (d i)) F`, taken as hypotheses.
  A block of size `0` is the zero algebra and is allowed. A presentation forces `G` to be finite
  (`F[G]` then has finite dimension `∑ i, d i ²`), so statements with a presentation carry no
  separate finiteness hypothesis. Tau Ceti's `TauCeti.exists_algEquiv_pi_matrix` gives one, with
  all `d i > 0`, when `F` is algebraically closed and `|G|` is nonzero in `F`. Over such a field
  the block sizes are exactly the dimensions of the irreducible representations of `G`
  (`TauCeti.exists_degree_eq_finrank`, `TauCeti.exists_isIrreducible_finrank_eq`), and they do not
  depend on the presentation (`TauCeti.natCard_degree_fiber_eq`); over `ℂ` they are the
  character degrees of Cohn and Umans. Nothing here depends on this identification.
- **Real powers** are `Real.rpow`. In `((n * m * p : ℕ) : ℝ) ^ (ω / 3)` the product is formed in
  `ℕ` and then cast; `0 ^ x = 0` for `x > 0`, and `ω / 3 > 0`, so a realization with `n m p = 0`
  makes the left side `0`. In `∑ i, (d i : ℝ) ^ ω` each size is cast before the power, and the sum
  is in `ℝ`. Statements about block sizes alone (3.2) are in `ℕ`.
- **The group of 1.3.** `cksuGroup n` is Mathlib's semidirect product
  `(H × H) ⋊[swapAction H] ℤˣ` with `H = Multiplicative (Fin 3 → ZMod n)`, so `(ℤ/n)³` written
  multiplicatively, and `ℤˣ = {1, −1}` playing the cyclic group of order 2, `−1` swapping the
  two factors. Mathlib's multiplication `⟨x, u⟩ ⟨y, v⟩ = ⟨x · φ(u)(y), u v⟩` is the source's
  convention, and `⟨(a, b), ±1⟩` is the source's `(a, b) z^j`. For `n = 0`, `ZMod 0 = ℤ` and the
  group is infinite; the statements of 1.3 hold there with Lean's values `0` of `Nat.card` and
  `Set.ncard`.
- Permutations compose as functions: `(σ τ) x = σ (τ x)`.
- "Proved here" means that the route is written out in full in this README; it claims no
  novelty.

## Layer 1: the triple product property

### 1.1 Realizations and their basic laws

Define `IsTPP S T U` and `Realizes G n m p` as in the Conventions (Cohn–Umans, Definition 2.1,
p. 3; Cohn–Kleinberg–Szegedy–Umans, Definition 1.3, p. 3; Bläser, Definition 10.1, p. 52).

Prove `realizes_spec`: for groups `G`, `H` with `G` finite, if `G` realizes `⟨n, m, p⟩` and `H`
realizes `⟨n', m', p'⟩`, then

- `G` realizes `⟨m, p, n⟩` and `⟨p, m, n⟩`, hence every permutation of `⟨n, m, p⟩`
  (Cohn–Umans, Lemma 2.1, p. 3);
- `G × H` realizes `⟨n n', m m', p p'⟩` (Bläser, Lemma 10.2, p. 52);
- if `n m p > 1`, then `(n m p)² < |G|³` (Cohn–Umans, Lemma 3.1, p. 4; Bläser, Lemma 10.5,
  p. 53; both in the form `α(G) > 2` for the pseudo-exponent of the Remarks of 2.4);
- if `G` is abelian, then `n m p ≤ |G|` (same locators, in the form `α(G) = 3`).

Prove `realizes_of_normal`: if a normal subgroup `N` of `G` realizes `⟨n, m, p⟩` and `G ⧸ N`
realizes `⟨n', m', p'⟩`, then `G` realizes `⟨n n', m m', p p'⟩` (Cohn–Umans, Lemma 2.2, p. 3,
with proof). (Proved here.)

Route.

- *Rotation.* If `s' s⁻¹ · t' t⁻¹ · u' u⁻¹ = 1` is the equation for `(S, T, U)`, conjugating by
  `s' s⁻¹` turns `t' t⁻¹ · u' u⁻¹ · s' s⁻¹ = 1` into it, so `(T, U, S)` has the property and `G`
  realizes `⟨m, p, n⟩`.
- *Transposition.* Inverting `u' u⁻¹ · t' t⁻¹ · s' s⁻¹ = 1` gives
  `s s'⁻¹ · t t'⁻¹ · u u'⁻¹ = 1`, the equation for `(S, T, U)` with the primed and unprimed
  elements exchanged, so `(U, T, S)` has the property. A rotation and this transposition generate
  all permutations of three letters.
- *Products.* Through `S ×ˢ S'`, `T ×ˢ T'`, `U ×ˢ U'` (`Finset.card_product`): the equation in
  `G × H` is the pair of equations in `G` and in `H`.
- *Counting.* Let `n m p > 1`, so `n, m, p ≥ 1`. The map `(s, t) ↦ s⁻¹ t` is injective on
  `S × T`: `s⁻¹ t = s'⁻¹ t'` gives `s' s⁻¹ · t t'⁻¹ · u u⁻¹ = 1` for any `u ∈ U`, so `s' = s` and
  `t = t'`. Hence `|G| ≥ n m`. If `p ≥ 2`, pick `u ≠ u'` in `U` and put `q = u' u⁻¹ ≠ 1`. No
  `s₁⁻¹ q t₁` equals an `s⁻¹ t`: otherwise `s s₁⁻¹ · q · t₁ t⁻¹ = 1`, an equation of the property
  for the order `(S, U, T)` (a permutation of the original order, by the first two items) with the
  `U`-quotient `q ≠ 1`. So `G` has at least `n m + 1` elements. By symmetry `|G| ≥ m p`, strictly
  if `n ≥ 2`, and `|G| ≥ p n`, strictly if `m ≥ 2`. One of `n, m, p` is at least `2`, and
  multiplying the three bounds gives `|G|³ > (n m p)²`.
- *Abelian groups.* If `G` is abelian, `s t u = s' t' u'` rearranges to
  `s s'⁻¹ · t t'⁻¹ · u u'⁻¹ = 1`, so the product map `S × T × U → G` is injective.
- *Extensions.* Let `N` realize `⟨n, m, p⟩` through `S₁, S₂, S₃` (subsets of `N`, read in `G`),
  let `G ⧸ N` realize `⟨n', m', p'⟩` through `T̄₁, T̄₂, T̄₃`, and choose `Tᵢ ⊆ G` with one
  representative of each coset in `T̄ᵢ` (`Quotient.out`). The sets `SᵢTᵢ = {s t}` have
  `|Sᵢ| |Tᵢ|` elements, since `s t = s₁ t₁` gives `t = t₁` modulo `N`, hence `t = t₁`. If
  `(s'₁ t'₁)(s₁ t₁)⁻¹ ⋯ (s'₃ t'₃)(s₃ t₃)⁻¹ = 1`, reducing modulo `N` (each `sᵢ` is in `N`) gives the
  equation of `G ⧸ N` for the `t̄`, so `t'ᵢ = tᵢ`; the equation becomes
  `s'₁ s₁⁻¹ · s'₂ s₂⁻¹ · s'₃ s₃⁻¹ = 1` in `N`, so `s'ᵢ = sᵢ`.

**Checks.**
- Right quotients, not left ones: in `S₃` let `S = {1}`, `T = {1, (2 3)}`,
  `U = {(1 2), (1 2 3)}`. The right quotients of `U` are `1` and `(1 3)`, and `(2 3)(1 3) ≠ 1`, so
  the triple has the property; the left quotient `(1 2)⁻¹ (1 2 3) = (2 3)` of `U` cancels against
  `(2 3) ∈ Q(T)`, so the variant with left quotients fails on it.
- `S₃` realizes `⟨2, 2, 2⟩` through its three subgroups of order 2, and `8 > 6 = |S₃|`: the
  abelian clause needs commutativity. Exhaustively over sets of size at most 3 (order 6) or 2
  (order 8), the largest `n m p` is `8` for `S₃`, `D₄`, `Q₈` and `C₂ × C₄`, and `6` for `C₆`, in
  line with both bounds.
- The rotation and the transposition preserve the property on all `10648` triples of subsets of
  `S₃` of size at most 2 (`6301` of them have the property).
- `n m p > 1` is needed: the trivial group realizes `⟨1, 1, 1⟩`, and `1 < 1³` is false.
- In `C₂ = {1, g}` the triple `S = {1}`, `T = {g}`, `U = {1, g}` has the property and
  `s⁻¹ t = g` lies in `Q(U)`: the set of the `s⁻¹ t` can meet `Q(U)` outside `1`, and the extra
  element of the counting is a translate `s⁻¹ q t` as above. The claim of the route about the
  translates holds for every triple with the property of nonempty small sets in `S₃`, `C₆`, `D₄`
  and `Q₈`.
- Extensions: for every proper nontrivial normal subgroup of `S₃`, `D₄` and `Q₈`, realizations of
  `N` and `G ⧸ N` by sets of size at most 2 and choices of representatives give realizations of
  the products with the expected sizes.

*Needs:* Mathlib `Finset.card_product`, `Prod.instGroup`, `QuotientGroup.mk`, `Quotient.out`,
`Subgroup.Normal`, `Finset.card_le_univ`.

### 1.2 The triangle construction

Define `triangularArray n`, the triples `x : Fin 3 → ℕ` with `x 0 + x 1 + x 2 + 1 = n` (the
`n (n + 1) / 2` points `(a, b, c)` with `a + b + c = n − 1`; empty for `n = 0`), and
`fixCoord n i`, the subgroup of `Equiv.Perm (triangularArray n)` of the permutations that preserve
the coordinate `i` of every point.

Prove `fixCoord_isTPP`: the subgroups `fixCoord n 0`, `fixCoord n 1`, `fixCoord n 2` have the
triple product property, and each has order `1! 2! ⋯ n!`, that is
`∏ j ∈ Finset.range n, (j + 1)!` (Cohn–Umans, Theorem 3.3 and its proof, p. 5;
Cohn–Kleinberg–Szegedy–Umans, Theorem 1.7, p. 3; Bläser, Example 10.6, p. 54). (Proved here.)

Route.

- *Order.* A permutation preserving coordinate `i` permutes each fibre `{x : x i = c}`, and any
  family of permutations of the fibres glues to one; the fibre of `c < n` has `n − c` points (the
  two other coordinates sum to `n − 1 − c`). So the subgroup is in bijection with
  `Π c < n, Perm (fibre c)`, of order `∏ c < n, (n − c)! = ∏ j < n, (j + 1)!`
  (`Fintype.card_perm`). For `n = 0` both sides are `1`.
- *Triple product property.* For subgroups the property says: `h₀ h₁ h₂ = 1` with
  `hᵢ ∈ fixCoord n i` forces `h₀ = h₁ = h₂ = 1` (take `hᵢ` the quotients). Order the points
  lexicographically by `(x 0, x 1, x 2)` and show by strong induction along this order that every
  point `x = (a, b, c)` is fixed by `h₀`, `h₁` and `h₂`. Suppose every smaller point is. If
  `h₂ x = y < x`, then `h₂ y = y = h₂ x` and `x = y`, absurd; so `h₂ x ≥ x`, and as `h₂` keeps
  `c` and the sum, `h₂ x = (a + i, b − i, c)` with `i ≥ 0`. Then `h₁` keeps the second coordinate,
  so `h₁ (h₂ x) = (a + i + j, b − i, c − j)` for an integer `j`, and `h₀` keeps the first, so
  `h₀ (h₁ (h₂ x)) = x` gives `j = −i` and `h₁ (h₂ x) = (a, b − i, c + i)`. If `i > 0` this point is
  smaller than `x`, so `h₀` fixes it, and `h₀ (h₁ (h₂ x)) = x` fails. So `i = 0`: `h₂ x = x`, then
  `h₁ x = (a + j, b, c − j)` and `h₀ (h₁ x) = x` give `j = 0`, `h₁ x = x` and `h₀ x = x`.

**Checks.**
- `n = 1, 2, 3, 4`: `1, 3, 6, 10` points, subgroups of orders `1, 2, 12, 288`, and the property
  holds.
- Negative control: for `n = 3` the triple `(fixCoord 3 0, fixCoord 3 0, fixCoord 3 1)` fails.

*Needs:* Mathlib `Equiv.Perm`, `Subgroup`, `Fintype.card_perm`, `Nat.factorial`,
`Finset.prod_range_succ`.

### 1.3 The construction of Cohn, Kleinberg, Szegedy and Umans

Define `swapAction A : ℤˣ →* MulAut (A × A)`, sending `−1` to `MulEquiv.prodComm`, the group
`cksuGroup n` as in the Conventions, and `cksuSet n i` for `i : Fin 3`: the elements `⟨(a, b), u⟩`
with `a` in the `i`-th coordinate copy `Hᵢ` of `ℤ/n` in `(ℤ/n)³` and `a ≠ 1`, and `b` in
`Hᵢ₊₁` (index `i + 1` in `Fin 3`, so `H₃ = H₀`), `u` arbitrary.

Prove `cksuSet_isTPP`: the sets `cksuSet n 0`, `cksuSet n 1`, `cksuSet n 2` have the triple product
property, each has `2 n (n − 1)` elements, and `cksuGroup n` has `2 n⁶` elements, for every `n`
(Cohn–Kleinberg–Szegedy–Umans, §2 and Lemma 2.1, p. 3; Bläser, Example 10.10, pp. 55–56).
(Proved here.)

Route. Write `H` additively, `z` for the swap, so `z (a, b) z = (b, a)`.

- *Sizes.* `(a, b, u) ↦ ⟨(a, b), u⟩` is injective, with `n − 1` choices of `a`, `n` of `b`, `2` of
  `u`. `SemidirectProduct.equivProd` gives `|G| = |H|² · |ℤˣ| = n⁶ · 2` (`Nat.card_prod`). For
  `n = 0` the sets and the group are infinite and all three values are `0`; for `n = 1` the sets
  are empty.
- *Quotients.* For `s = (a, b) z^j` and `s' = (a', b') z^j'` in `Sᵢ`, the quotient `s' s⁻¹` is
  `(a' − a, b' − b)` if `j = j'`, and `(a' − b, b' − a) z` otherwise; here `a, a' ∈ Hᵢ ∖ {0}` and
  `b, b' ∈ Hᵢ₊₁`.
- *No `z`.* If `q₀ q₁ q₂ = 1` and no `qᵢ` contains `z`, the sum
  `(Σ (a'ᵢ − aᵢ), Σ (b'ᵢ − bᵢ)) = 0` has its summands in the three independent coordinate
  subgroups, so `a'ᵢ = aᵢ`, `b'ᵢ = bᵢ` and `j'ᵢ = jᵢ`: all `qᵢ = 1`.
- *Two `z`.* The number of `z` among the `qᵢ` is even (project to `ℤˣ`). Write
  `qᵢ = (xᵢ, yᵢ) z^εᵢ`; the first component of `q₀ q₁ q₂` is the `H`-part of
  `(x₀, y₀) + σ^ε₀ (x₁, y₁) + σ^(ε₀ + ε₁) (x₂, y₂)`, `σ` the swap. If `(ε₀, ε₁, ε₂) = (1, 1, 0)`
  the first component is `x₀ + y₁ + x₂`, whose `H₀`-coordinate is `a'₀`; if `(1, 0, 1)` the
  second component is `y₀ + x₁ + x₂`, whose `H₂`-coordinate is `a'₂`; if `(0, 1, 1)` the first
  component is `x₀ + x₁ + y₂`, whose `H₁`-coordinate is `a'₁`. (In each case every other summand
  lies in other coordinate subgroups.) As every `a'ᵢ ≠ 0`, the product is not `1`.

**Checks.**
- `n = 1, …, 5`: orders `2, 128, 1458, 8192, 31250`, sets of sizes `0, 4, 12, 24, 40`, and the
  property holds.
- Negative control: for `n = 2`, allowing `a = 0` in the definition of the sets breaks the property.

*Needs:* Mathlib `SemidirectProduct`, `SemidirectProduct.equivProd`, `MulEquiv.prodComm`,
`Int.units_eq_one_or`, `Multiplicative`, `ZMod`, `Set.ncard`, `Nat.card_prod`.

### Examples

`S₃` realizes `⟨2, 2, 2⟩`; the triangular array of side `2` gives the same in `Sym(3)`; the
second construction at `n = 5` realizes `⟨40, 40, 40⟩` in a group of order `31250`.

### Dependencies

Mathlib only.

## Layer 2: matrix multiplication in the group algebra

### 2.1 Tensors and the group tensor

Use `CoordTensor`, its `Zero`, `One`, `Add` and `Mul` instances, `restrictLE`, `tensorRank`,
`mmTensor` and `matMulExponent`, copied verbatim from AsymptoticSpectra 3.1 and 3.3. Define
`groupTensor F G` as in the Conventions.

**Checks.**
- For `S₃` over `ℚ`, with `e` sending `g` to `(1, sign g, ρ(g))` (`ρ` the two-dimensional
  representation in an integral basis): `[a b = c]` and the structure tensor of `ℚ × ℚ × Mat₂(ℚ)`
  correspond exactly under the change of basis of 2.3; `[a b c = 1]` is `[a b = c⁻¹]`; and
  `mmTensor F d` is the structure tensor of `Mat_d` with `(i, k) ↦ (k, i)` on the third party, for
  `d ≤ 3`.
- The cyclic form matters: with `[a b = c]` in place of `[a b c = 1]`, the maps of 2.2 do not
  carry the group tensor of `S₃` to `mmTensor F 2`.

### 2.2 Matrix multiplication inside the group tensor

Prove `restrictLE_mmTensor_groupTensor`: over every field `F`, if a finite group `G` realizes
`⟨n, n, n⟩`, then `mmTensor F n` is a restriction of `groupTensor F G` (Cohn–Umans, Theorem 2.3,
p. 4, for any field and rectangular sizes; Bläser, Theorem 10.3, p. 53). (Proved here.)

Route. Let `S = {s_i}`, `T = {t_j}`, `U = {u_k}`, enumerated by `Fin n`. Send the index `(i, j)` of
party 0 to `s_i⁻¹ t_j`, `(j, k)` of party 1 to `t_j⁻¹ u_k`, `(k, i)` of party 2 to `u_k⁻¹ s_i`, and
take for `A p` the `0/1` matrices selecting these elements. The three maps are injective (1.1,
counting). The coordinate of the restriction at `(x₀, x₁, x₂) = ((i, j), (j', k), (k', i'))` is
`[s_i⁻¹ t_j · t_j'⁻¹ u_k · u_k'⁻¹ s_i' = 1]`; conjugating by `s_i` this is
`t_j t_j'⁻¹ · u_k u_k'⁻¹ · s_i' s_i⁻¹ = 1`, which by the property in the order `(T, U, S)` holds
exactly when `j = j'`, `k = k'` and `i = i'`: the coordinate of `mmTensor F n`. For `n = 0` both
dimensions on the left are `0` and the empty matrices work.

**Checks.**
- The coordinate identity holds exactly for `S₃` with its three subgroups of order 2 (under an
  arbitrary enumeration of `S₃`) and for the triangular array of side `2`.

*Needs:* 1.1; Mathlib `Matrix.of`, `Matrix.mulVec`, `Fin.divNat`, `Fin.modNat`,
`Fintype.equivFin`, `Finset.equivFin`.

### 2.3 Wedderburn presentations and the group tensor

Prove `groupTensor_equiv_sum`: over every field `F`, for a finite group `G` and a presentation
`e : MonoidAlgebra F G ≃ₐ[F] Π i : Fin q, Matrix (Fin (d i)) (Fin (d i)) F`, the group tensor is
a restriction of the direct sum `(List.ofFn fun i ↦ mmTensor F (d i)).sum` and conversely
(Cohn–Umans, display (1), p. 5, and Bläser, proof of Theorem 10.7, p. 54, state the isomorphism
over `ℂ`). (Proved here.)

Route.

- *Structure tensors.* For an `F`-algebra `A` with a basis `(a_x)`, write `T_A(x, y, z)` for the
  coefficient of `a_z` in `a_x a_y`. If `e : A ≃ₐ B` and `e(a_x) = Σ M(x', x) b_x'`, applying `e`
  to `a_x a_y = Σ T_A(x, y, z) a_z` and comparing coefficients gives
  `T_A(x, y, z) = Σ M(x', x) M(y', y) M⁻¹(z, z') T_B(x', y', z')`, so `T_A` is a restriction of
  `T_B` by `(Mᵀ, Mᵀ, M⁻¹)`, and symmetrically along `e⁻¹`. `M` is invertible because `e` is a
  linear equivalence. No hypothesis on `F` or on `|G|` is used.
- *Products.* In the basis of matrix units of `Π i, Mat_{d i}(F)`, products of units from
  different blocks vanish, so its structure tensor is the block direct sum of the structure
  tensors of the factors; the index layout of the `CoordTensor` sum of the list (left block first,
  a trailing `0` of dimension `0`) is a relabelling of the natural one. A block with `d i = 0`
  contributes nothing on either side.
- *Relabellings.* Pass from `[a b = c]` to `groupTensor F G` and from the structure tensors of the
  matrix algebras to `mmTensor F (d i)` by the relabellings of the Conventions.

**Checks.**
- The change of basis and its inverse, exactly over `ℚ` for `S₃` and the presentation of 2.1,
  including the cyclic relabellings; `1 + 1 + 4 = 6`.

*Needs:* 2.1; Mathlib `MonoidAlgebra.basis`, `AlgEquiv.toLinearEquiv`, `Matrix.stdBasis`,
`Pi.basisFun`, `LinearMap.toMatrix`, `Module.finrank_eq_card_basis`.

### 2.4 The Cohn–Umans bound

Prove `rpow_le_sum_rpow`: over every field `F`, if `MonoidAlgebra F G` has a presentation `e` with
block sizes `d : Fin q → ℕ` and `G` realizes `⟨n, m, p⟩`, then
`((n m p : ℕ) : ℝ) ^ (ω / 3) ≤ ∑ i, (d i : ℝ) ^ ω` with `ω = matMulExponent F` (Cohn–Umans,
Theorem 4.1, p. 5; Cohn–Kleinberg–Szegedy–Umans, Theorem 1.8, p. 3; Bläser, Theorem 10.7,
pp. 54–55; all over `ℂ`). (Proved here; the route uses only the square tensor.)

Route. Write `R` for `tensorRank`, `⟨k⟩` for `mmTensor F k`, `≤` for `restrictLE` and `≈` for
restriction both ways; `G` is finite (Conventions). Restriction on `Fin 3` is a Strassen preorder
(AsymptoticSpectra `isStrassenPreorder_restrictLE`, `2 ≤ 3`) whose rank is `R`
(`abstractRank_restrictLE`).

- *Rank calculus.* From these two statements: every `s` satisfies `s ≤ Nat.unaryCast (R s)`, as
  the set defining the abstract rank is nonempty (the Archimedean field of the Strassen preorder
  with `b = Nat.unaryCast 1`, which is not below `0` by its field on natural numbers, gives
  `s ≤ Nat.unaryCast r * Nat.unaryCast 1 ≈ Nat.unaryCast r`) and a nonempty set of natural
  numbers contains its infimum; `R` is monotone for `≤` and constant on `≈`-classes;
  `R(s + t) ≤ R(s) + R(t)` and `R(s t) ≤ R(s) R(t)`, since the natural numbers
  `Nat.unaryCast r` add and multiply as in `ℕ` up to `≈` (induction on `r` with the semiring laws
  up to `≈` and compatibility of the preorder). Also `⟨a⟩ ⟨b⟩ ≈ ⟨a b⟩` by regrouping each index
  `((i₁, j₁), (i₂, j₂)) ↦ (b i₁ + i₂, b j₁ + j₂)` (`finProdFinEquiv`), and `⟨a⟩ ≤ ⟨b⟩` for
  `a ≤ b` by the matrices reading off the pairs in `Fin a × Fin a`.
- *Square lower bound.* For `N ≥ 1`, `N^ω ≤ R(⟨N⟩)`. Put `r = R(⟨N⟩) ≥ 1` (`⟨N⟩ ≠ 0`). For
  `N = 1` both sides are `1`. Let `N ≥ 2` and `n' ≥ 1`. If `n' = 1`, `R(⟨1⟩) = 1 ≤ r`. If
  `n' ≥ 2`, let `k ≥ 1` be least with `n' ≤ N^k`, so `N^(k−1) < n'`; then
  `R(⟨n'⟩) ≤ R(⟨N^k⟩) ≤ r^k = r · (N^(k−1))^(log_N r) ≤ r · n'^(log_N r)`, as `log_N r ≥ 0`. So
  `log_N r` lies in the set defining `ω` (with `C = r`), `ω ≤ log_N r` and `N^ω ≤ r`.
- *Group tensors multiply.* `groupTensor F (G × H) ≈ groupTensor F G * groupTensor F H`: relabel
  each party by `x ↦ (e_G (x.divNat), e_H (x.modNat))`; the coordinates `[a₁a₂a₃ = 1 ∧ b₁b₂b₃ = 1]`
  agree.
- *Cubing.* Let `N = n m p`. If `N = 0` the left side is `0 ^ (ω/3) = 0` (`ω ≥ 2`, AsymptoticSpectra
  `matMulExponent_spec`) and the right side is a sum of nonnegative terms. Let `N ≥ 1`. By 1.1,
  `G` realizes `⟨m, p, n⟩` and `⟨p, n, m⟩`, so `G × (G × G)` realizes `⟨N, N, N⟩`. By 2.2 and the
  previous item, `⟨N⟩ ≤ t³` with `t = groupTensor F G`, so `⟨N^k⟩ ≈ ⟨N⟩^k ≤ t^(3k)`.
- *Expansion.* By 2.3, `t ≈ Σᵢ ⟨d i⟩`, so `t^(3k) ≈ Σ_w ⟨d_w⟩` over the words `w` of length `3k`
  in `Fin q`, with `d_w` the product of the `d (w l)` (distributivity up to `≈`). Fix `τ` in the
  set defining `ω`, with constant `C`; then `C ≥ R(⟨1⟩) = 1` and `τ ≥ ω ≥ 2`. Each
  `R(⟨d_w⟩) ≤ C d_w^τ`, also when `d_w = 0` (rank `0`, and `0^τ = 0`). Summing,
  `(N^k)^ω ≤ R(⟨N^k⟩) ≤ C (Σᵢ d i^τ)^(3k)`. Taking `k`-th roots and letting `k → ∞`,
  `N^ω ≤ (Σᵢ d i^τ)³`, that is `N^(ω/3) ≤ Σᵢ d i^τ`.
- *Limit.* The set defining `ω` is closed upwards (`C ≥ 1`, `n^τ` increasing in `τ` for `n ≥ 1`)
  and `ω` is its infimum (Conventions), so every `τ > ω` is in it. As `τ ↓ ω`, `d i^τ → d i^ω`
  (continuity of `x ↦ d^x` for `d > 0`; for `d = 0` both are `0`), and the bound holds at `ω`.

**Checks.**
- `S₃` (blocks `1, 1, 2`) and `⟨2, 2, 2⟩`: the bound reads `2^ω ≤ 2 + 2^ω`, true and empty.
  Abelian groups give nothing: all blocks have size `1` (3.1 with `A = G`), the right side is the
  number `|G|` of blocks, and 1.1 already gives `n m p ≤ |G|`.

*Needs:* 1.1, 2.2, 2.3; AsymptoticSpectra 3.1 `isStrassenPreorder_restrictLE` and
`abstractRank_restrictLE`, 3.3 `matMulExponent_spec`; Mathlib `finProdFinEquiv`,
`Real.rpow_natCast`, `Real.rpow_le_rpow_left_iff`, `Real.continuous_const_rpow`, `Real.logb`,
`Real.sInf_def`, `Real.sInf_empty`, `Real.sInf_of_not_bddBelow`, `exists_lt_of_csInf_lt`,
`csInf_le`, `Nat.sInf_mem`, `Fintype.prod_sum`.

### Remarks

- The pseudo-exponent of Cohn and Umans (Definition 3.1, p. 4), `α(G)`, the least
  `3 log |G| / log (n m p)` over realizations with `n m p > 1` (and `3` for the trivial group), lies
  in `(2, 3]` by 1.1 (`⟨|G|, 1, 1⟩` is realized through `G, {1}, {1}`), and equals `3` for abelian
  groups. It is not defined here.
- With `d₁² + ⋯ + d_q² = |G|` (Tau Ceti `AlgEquiv.sum_sq_eq_card_of_pi_matrix`) and `ω ≥ 2`, 2.4
  gives `(n m p)^(ω/3) ≤ d_max^(ω−2) |G|` (Cohn–Kleinberg–Szegedy–Umans, Corollary 1.9, p. 3).

### Examples

The group tensor of `S₃` over `ℚ` is equivalent to `⟨1, 1, 1⟩ + ⟨1, 1, 1⟩ + ⟨2, 2, 2⟩`, and
contains `⟨2, 2, 2⟩` by 2.2.

### Dependencies

Layer 1; AsymptoticSpectra 3.1, 3.3; Mathlib.

## Layer 3: block sizes

### 3.1 Abelian subgroups bound the block sizes

Prove `le_index_of_isMulCommutative`: if `F` is algebraically closed, `A` is an abelian subgroup of
`G` (`IsMulCommutative A`) and `e` is a presentation of `MonoidAlgebra F G` with block sizes `d`,
then `d i ≤ A.index` for every `i` (Cohn–Kleinberg–Szegedy–Umans, p. 2, state it for the character
degrees over `ℂ` and cite a textbook; no proof is given there). (Proved here.)

Route. `G` is finite (Conventions), so `A.index ≥ 1`; if `d i = 0` there is nothing to prove. Let
`d i > 0`. The block representation `ρ = TauCeti.blockRepresentation e i` on `Fin (d i) → F` is
irreducible (`TauCeti.isIrreducible_blockRepresentation`). Restrict it to `A`; it contains an
irreducible subrepresentation `W ≠ 0` (`Representation.exists_isIrreducible_subrepresentation`).
For `a ∈ A`, `ρ a` maps `W` to itself and commutes with every `ρ b`, `b ∈ A`, so it acts on `W` by
a scalar (`Representation.IsIrreducible.exists_forall_apply_eq_smul`, `F` algebraically closed).
Pick `v ≠ 0` in `W`: `ρ a v = λ_a v` for all `a ∈ A`. Let `R` be a set of representatives of the
left cosets `g A` (`A.index` elements) and `V'` the span of the `ρ g v`, `g ∈ R`. For `h ∈ G` and
`g ∈ R`, `h g = g' a` with `g' ∈ R`, `a ∈ A`, so `ρ h (ρ g v) = λ_a ρ g' v ∈ V'`. So `V'` is a
nonzero subrepresentation of `ρ`, hence everything, and `d i = dim V' ≤ |R| = A.index`.

**Checks.**
- `S₃` (sizes `1, 1, 2`), with `A₃` of index 2: `2 ≤ 2`. Commutativity is needed: `A = S₃` has
  index `1 < 2`.
- In the group of 1.3, `H × H` is abelian of index `2` (`n = 2, 3`); the group is not abelian.

*Needs:* Tau Ceti `TauCeti.blockRepresentation`, `TauCeti.isIrreducible_blockRepresentation`,
`Representation.exists_isIrreducible_subrepresentation`,
`Representation.IsIrreducible.exists_forall_apply_eq_smul`; Mathlib `IsMulCommutative`,
`Subgroup.index`, `Subgroup.index_eq_card`, `QuotientGroup.mk`, `Quotient.out`,
`QuotientGroup.mk_out_eq_mul`, `Submodule.span`, `finrank_span_le_card`, and, for the finiteness of
`G`, `MonoidAlgebra.basis` and `Module.Finite.finite_basis`.

### 3.2 Beating the sum of the cubes

Prove `sum_cube_lt`: if `F` is algebraically closed and `e` is a presentation of
`MonoidAlgebra F (cksuGroup n)` with block sizes `d`, then every `d i ≤ 2`,
`∑ i, d i ³ ≤ 4 n⁶`, and, for `n ≥ 5`, `∑ i, d i ³ < (2 n (n − 1))³`
(Cohn–Kleinberg–Szegedy–Umans, §2, p. 3; Bläser, Example 10.10, p. 55). (Proved here.)

Route. A presentation forces `cksuGroup n` to be finite, so `n ≥ 1`. The subgroup `H × H`, the
range of `SemidirectProduct.inl`, is the kernel of `SemidirectProduct.rightHom` onto `ℤˣ`
(`SemidirectProduct.range_inl_eq_ker_rightHom`), so it has index `2` and is abelian; 3.1 gives
`d i ≤ 2`. Then `d i³ ≤ 2 d i²`, and `∑ i, d i² = |G| = 2 n⁶` (Tau Ceti
`AlgEquiv.sum_sq_eq_card_of_pi_matrix`, and 1.3), so `∑ i, d i³ ≤ 4 n⁶`. Finally
`(2 n (n − 1))³ = 8 n³ (n − 1)³ > 4 n⁶` exactly when `2 (n − 1)³ > n³`; at `n = 5`,
`128 > 125`, and `n ↦ 2 (n − 1)³ − n³` increases for `n ≥ 4` (its difference
`2 (3n² − 3n + 1) − (3n² + 3n + 1)` is `3n² − 9n + 1 > 0`).

**Checks.**
- `n = 5`: `64000 > 62500`; `n = 4`: `13824 < 16384`, so the inequality starts at `n = 5`.
- For `n = 2, 3` over `ℂ`: `44` and `405` conjugacy classes; sizes in `{1, 2}` with squares summing
  to `2n⁶` force `16` and `54` blocks of size `1`, which equals `|G/[G, G]|` computed directly,
  and cube sums `240 ≤ 256` and `2862 ≤ 2916`.

### Remarks

- Over an algebraically closed field of characteristic neither `2` nor `5`, Tau Ceti gives a
  presentation of the group algebra of `cksuGroup 5` (`|G| = 2 · 5⁶`), and 2.4 with
  `d i^ω = d i^(ω−2) d i² ≤ 2^(ω−2) d i²` gives `40^ω ≤ 2^(ω−1) 5⁶`, that is
  `20^ω ≤ 5⁶ / 2 < 20³`: the group-theoretic method alone shows `ω < 3`, which is the point of the
  construction (Cohn–Kleinberg–Szegedy–Umans report `ω < 2.9088` from `n = 17`). This numerical
  bound is weaker than `ω ≤ log₂ 7` of AsymptoticSpectra 3.3 (`log₂ 7 < 2.81` and
  `20^2.81 < 5⁶/2`, by integer powers), so the theorem stated is the inequality between block
  sizes, which does not involve `ω`.

### Examples

`n = 5`: blocks of size at most `2`, cubes summing to at most `62500 < 64000 = 40³`.

### Dependencies

1.3 and 3.1 for 3.2, 2.4 for the remarks; Tau Ceti; Mathlib.

## Scope and ownership

This roadmap develops the group-theoretic approach of Cohn and Umans to the exponent of matrix
multiplication of AsymptoticSpectra and owns: the triple product property and realizations with
their permutation, product and extension laws and the size bounds (1.1); the triangle
construction (1.2) and the construction of Cohn, Kleinberg, Szegedy and Umans (1.3); the group
tensor, the square embedding of matrix multiplication, the tensor form of a Wedderburn
presentation and the Cohn–Umans bound (Layer 2); the bound of block sizes by abelian subgroups
and the sum of the cubes for the second construction (Layer 3). It restates none of the theorems
of AsymptoticSpectra: the Strassen preorder of tensors, the equality of the two ranks and
`2 ≤ ω ≤ log₂ 7` are its 3.1 and 3.3, and the square lower bound `N^ω ≤ R(⟨N⟩)` and the product of
matrix multiplication tensors are route steps of 2.4 here.

Library survey. Pinned Tau Ceti has the existence of a Wedderburn presentation of a finite group
algebra over an algebraically closed field (`TauCeti.exists_algEquiv_pi_matrix`), the sum of
squares of the block sizes, the block representations and their irreducibility, and the
classification of irreducible representations by blocks; it has no bound of block sizes or
irreducible degrees by the index of an abelian subgroup. RepresentationTheory/CharacterTheory
(main) §2.1 consumes the same Wedderburn statements; it is not used here. Tau Ceti's closest
objects to the group tensor are counts: the class structure constants `TauCeti.structureConstant`
(`TauCeti/RepresentationTheory/CharacterTable/ClassSum/StructureConstants.lean`) count the
solutions of `x y = g` with `x`, `y` in given conjugacy classes, and `TauCeti.productOneTriples`
(`…/CharacterTable/ProductOne.lean`) collects the triples with `z y x = 1` and entries in given
classes; the group tensor is the array of all solutions of `a b c = 1`, without classes. Pinned
Mathlib has the group algebra, semidirect products, permutations and Artin–Wedderburn, and a CP
rank of holors, `Holor.cprank` (`Mathlib/Data/Holor.lean`), which AsymptoticSpectra 3.1 relates
to `tensorRank`; neither library has the triple product property or group tensors.

Not treated here: rectangular matrix multiplication tensors and the rectangular form
`⟨n, m, p⟩ ≤ F[G]` of the embedding (the square form and 1.1 suffice); the simultaneous triple
product property and its theorem, which need Schönhage's asymptotic sum inequality; uniquely
solvable puzzles and the wreath-product constructions with their bounds below `2.48` and `2.41`;
the parameter `γ(G)` and the corollaries comparing it with `α(G)`; obstructions to the approach;
border rank and degeneration.

These are standard facts of the theory of fast matrix multiplication of the kind the preprint
*The matrix multiplication exponent is nine fourths* (OpenAI, 2026; public repository
`openai/math`, Apache-2.0) recalls in its historical introduction; nothing here rests on it, and
none of its results is stated.

## Exact supplier contracts

### From Mathlib

- `MonoidAlgebra`, `MonoidAlgebra.basis`, `AlgEquiv` (`≃ₐ[F]`), `Matrix`: the presentations.
- `Equiv.Perm`, `Subgroup`, `Subgroup.Normal`, `Subgroup.index`, `IsMulCommutative`,
  `QuotientGroup.mk`, `Quotient.out`, `Prod.instGroup`: Layer 1, 3.1.
- `SemidirectProduct` (`⋊[φ]`, multiplication `⟨x, u⟩ ⟨y, v⟩ = ⟨x · φ u y, u v⟩`),
  `SemidirectProduct.equivProd`, `SemidirectProduct.inl`, `SemidirectProduct.rightHom`,
  `SemidirectProduct.range_inl_eq_ker_rightHom`, `MulAut`, `MulEquiv.prodComm`,
  `Int.units_eq_one_or`, `Multiplicative`, `ZMod`: 1.3, 3.2.
- `Fintype.equivFin`, `Finset.card_product`, `Fintype.card_perm`, `Set.ncard`, `Nat.card`: Layers
  1 and 2.
- `Matrix.of`, `Matrix.mulVec`, `Fin.divNat`, `Fin.modNat`, `finProdFinEquiv`,
  `Nat.sub_lt_left_of_lt_add`: the copied definitions and 2.2–2.4.
- `Real.rpow`, `Real.rpow_natCast`, `Real.rpow_le_rpow_left_iff`, `Real.continuous_const_rpow`,
  `Real.logb`, `Real.sInf_def`, `Real.sInf_empty`, `Real.sInf_of_not_bddBelow`,
  `exists_lt_of_csInf_lt`, `csInf_le`, `Nat.sInf_mem`, `Fintype.prod_sum`: 2.4.
- `Submodule.span`, `finrank_span_le_card`, `Subgroup.index_eq_card`,
  `QuotientGroup.mk_out_eq_mul`, `Module.Finite.finite_basis`: 3.1.

### From Tau Ceti

- `TauCeti.exists_algEquiv_pi_matrix`
  (`TauCeti/RepresentationTheory/CharacterTable/Wedderburn.lean`; `[Field k] [Group G] [Finite G]
  [NeZero (Nat.card G : k)] [IsAlgClosed k]`): a presentation with all sizes positive; Conventions
  and the remark of 3.2.
- `AlgEquiv.sum_sq_eq_card_of_pi_matrix` (same file; `[CommSemiring k] [StrongRankCondition k]
  [Monoid G]`, finite index type): `∑ i, d i ^ 2 = Nat.card G`; 3.2 and the remarks of 2.4.
- `TauCeti.blockRepresentation` and `TauCeti.isIrreducible_blockRepresentation`
  (`TauCeti/RepresentationTheory/CharacterTable/BlockRepresentation.lean`; the representation
  needs `[CommSemiring k] [Monoid G]`, its irreducibility `[Field k]` and `[NeZero (d i)]`): the
  representation on a block is irreducible; 3.1.
- `Representation.exists_isIrreducible_subrepresentation` (`[FiniteDimensional k V]
  [Nontrivial V]`) and `Representation.IsIrreducible.exists_forall_apply_eq_smul`
  (`[IsAlgClosed k] [FiniteDimensional k V]`, irreducible `ρ`)
  (`TauCeti/RepresentationTheory/Irreducible.lean`): 3.1.
- `TauCeti.exists_degree_eq_finrank`, `TauCeti.exists_isIrreducible_finrank_eq` and
  `TauCeti.natCard_degree_fiber_eq`
  (`TauCeti/RepresentationTheory/CharacterTable/IrreducibleClassification.lean`; positive sizes,
  and for the first and the third a finite group, an algebraically closed field and `Nat.card G`
  invertible): the block sizes are the dimensions of the irreducible representations and do not
  depend on the presentation; Conventions only.

### From TauCetiRoadmap.AsymptoticSpectra

- 3.1 `CoordTensor` with its `Zero`, `One`, `Add` and `Mul` instances, `restrictLE`, `tensorRank`
  (copied verbatim); `isStrassenPreorder_restrictLE` (at least two parties: `Fin 3`) and
  `abstractRank_restrictLE` (any finite set of parties): 2.4.
- 3.3 `mmTensor` and `matMulExponent` (copied verbatim); `matMulExponent_spec` (every field:
  `2 ≤ ω ≤ log₂ 7`): Conventions, 2.4, the remark of 3.2.
- Its Layer 1 definition of the abstract rank `abstractRank`, through `abstractRank_restrictLE`.

## References

- H. Cohn and C. Umans, *A group-theoretic approach to fast matrix multiplication*, FOCS 2003;
  arXiv:math/0307321v2; pages of the arXiv PDF. Cited as "Cohn–Umans".
- H. Cohn, R. Kleinberg, B. Szegedy and C. Umans, *Group-theoretic algorithms for matrix
  multiplication*, FOCS 2005; arXiv:math/0511460v1; pages of the arXiv PDF. Cited as
  "Cohn–Kleinberg–Szegedy–Umans".
- M. Bläser, *Fast matrix multiplication*, Theory of Computing Library, Graduate Surveys 5
  (2013), pp. 1–60; open at theoryofcomputing.org; printed pages. Cited as "Bläser".
