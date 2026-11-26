import Mathlib

/-!
# Orbit measures on adelic groups: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. Of the four
headlines, the first three are not statable at the pins; of the fourth (4.1), clause (a) is stated
below and clause (b) is not statable at the pins.

The first three headlines are statements about Tamagawa measures: Haar measures on the adelic
points `G(𝔸_F)` of a linear algebraic group `G` over a number field `F`, built as restricted
products over the places `v` of the measures `|ω|_v` of a gauge form `ω`, corrected by convergence
factors and a power of the discriminant (AdelicAlgebraicGroups §§0.3, 2.4). Tau Ceti has affine
groups in Hopf coordinates with the topology of their points, the idele norm
`TauCeti.GlobalNumberFields.ideleNorm` and the local compactness of the adeles; Mathlib has the
adele ring `NumberField.AdeleRing`, the idele group `NumberField.IdeleGroup`, the idele class group
`NumberField.IdeleClassGroup` and the residue `NumberField.dedekindZeta_residue`. Neither has a
normalised Haar measure on the adeles or on the ideles (a restricted product of local Haar
measures), the measure `|ω|_v` of a top form on the points of a smooth variety over a local field,
gauge forms, convergence factors, the Tamagawa measure or the Tamagawa number. A Haar measure
fixed only up to a scalar does not suffice: the normalisation is the content of each statement.

* The Tamagawa number of `G_m` (3.4a): for every number field `F`, `τ(G_m) = 1`; equivalently, for
  the measure induced by Tate's measure `d^×x` on the norm-one ideles, `F^×\𝔸_F^1` has volume
  `κ_F = Res_{s=1} ζ_F(s)`. It lacks Tate's measure `d^×x` (the restricted product of the
  normalised local multiplicative Haar measures), the measure it induces on the norm-one ideles and
  on their quotient by `F^×`, and the Tamagawa measure of `G_m`.
* The comparison of Tamagawa measures on a homogeneous space (2.6): for a smooth connected affine
  group `G` over `F` acting on an affine variety, an `F`-point `x` with smooth connected stabilizer
  `H`, both unimodular in the algebraic sense, and an injective restriction `X^*(G) → X^*(H)` with
  finite cokernel, the quotient of `τ_G` by `τ_H` on `H(𝔸)\G(𝔸)` is the restricted product
  `|d_F|^{−dim X/2} ∏_v |ω_X|_v` of the local measures of an invariant gauge form `ω_X` on the
  orbit; on an orbit in a level set of an invariant morphism of vector spaces it is the restricted
  product of the local fibre measures. It lacks the Haar measures of the adelic points of an affine
  group, invariant gauge forms on groups and on homogeneous spaces, the measure of a top form over
  a local field and its fibre formula, the Tamagawa measure, and the restricted product of local
  measures on `H(𝔸)\G(𝔸)`.
* The Tamagawa numbers of groups with a unipotent radical and of quotients by central induced tori
  (3.4a): `τ(M ⋉ N) = τ(M)` for `N` unipotent and `M` connected reductive, and
  `τ(G_2/T_1) = i·τ(G_2)/τ(T_1)` for a central induced torus `T_1` of a connected reductive group
  `G_2`, `i` being the index of the image of `X^*_F(G_2) → X^*_F(T_1)`. It lacks, besides the
  Tamagawa measure, the norm-one subgroup `G(𝔸)^1` with its measure and the Tamagawa number
  `τ(G)`.

Clause (b) of the fourth headline is the centraliser of a regular element of a unitary group: for
a nondegenerate Hermitian space `V` over a quadratic extension `E/F` of fields of characteristic
zero, the element `γ` attached to a monic irreducible `P ∈ E[X]` with
`P(X) = c(P(0))^{−1} X^n P^c(1/X)` has, on points over every commutative `F`-algebra `R`, the
norm-one torus of `E[X]/(P)` as its centraliser in `U(V)(R)`. It lacks the unitary group `U(V)`
as a group functor on commutative `F`-algebras, that is the extension of a Hermitian form to
`R ⊗_F V` over `R ⊗_F E` and the group of its isometries: Mathlib extends the scalars of bilinear
forms (`LinearMap.BilinForm.baseChange`) but not of sesquilinear ones, and its
`Matrix.unitaryGroup` is the group of matrices whose conjugate transpose, for a star ring, is
their inverse.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.OrbitMeasuresOnAdelicGroups

/-! ## Layer 4: Centralisers of elements with separable characteristic polynomial -/

/-- **Matrices commuting with an element with separable characteristic polynomial** (4.1 (a)).
Let `k` be a field and `g` an `n × n` matrix over `k`, invertible or not, whose characteristic
polynomial is separable. Then every `n × n` matrix `y` over `k` that commutes with `g` is a
polynomial in `g` with coefficients in `k`. So any two matrices that commute with `g` commute with
each other, and for `g ∈ GL_n(k)` the centraliser of `g` in `GL_n(k)` is the group of units of
`k[g]`. -/
theorem exists_eq_aeval_of_separable_charpoly {k : Type*} [Field k] {n : Type*} [Fintype n]
    [DecidableEq n] (g : Matrix n n k) (hg : g.charpoly.Separable)
    {y : Matrix n n k} (hy : Commute g y) :
    ∃ p : Polynomial k, y = Polynomial.aeval g p := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.OrbitMeasuresOnAdelicGroups
