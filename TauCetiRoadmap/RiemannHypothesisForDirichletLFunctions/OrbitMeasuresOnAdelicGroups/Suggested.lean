import Mathlib
import TauCeti.Algebra.AlgebraicGroup.Connected.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.Connected.GroupScheme
import TauCeti.Algebra.AlgebraicGroup.Derived.Semisimple
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Points.Vanishing
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Representation.SemisimplePoint.Basic
import TauCeti.Algebra.AlgebraicGroup.SimplyConnected.Basic

/-!
# Orbit measures on adelic groups: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. Of the four
headlines, the first three are not statable at the pins, and the fourth is stated below in two of
its clauses.

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
* Centralisers of semisimple elements (4.1): for a connected reductive group `G` over an
  algebraically closed field and a semisimple `s ∈ G`, the identity component of `C_G(s)` is
  reductive, and `C_G(s)` is connected when the derived group of `G` is simply connected. These two
  clauses are stated below, with `G` given by its coordinate Hopf algebra `H` over the
  algebraically closed field `k` and `C_G(s)` the closed subgroup cut out by the vanishing ideal of
  the subgroup of `G(k)` of the elements commuting with `s`. Over `k` this reduced subgroup has the
  same points and the same underlying space as the scheme-theoretic centraliser, so the
  connectedness of (c) and the identity component in (a) are the same for both; that the two
  coincide is the smoothness clause of (a), which is not stated. The scheme-theoretic centraliser
  of a point is not at the pins: Tau Ceti has the centraliser of a closed diagonalizable subgroup,
  and using it here would need, as data, the diagonalizable closure of the powers of `s`, whose
  existence is a theorem.

The root system and the Weyl group of `C_G(s)°` in (a), and the clauses (b), (d) and (e) of 4.1,
are the structure that the proof of the headline provides, not headline statements, and they are
not stated. The case `G = GL_n` of 4.1 (the centraliser of a diagonal matrix is a product of
general linear groups) is statable in Mathlib's `Matrix.GeneralLinearGroup`; it is a special case
and a Check of 4.1 and is not stated.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.OrbitMeasuresOnAdelicGroups

open TauCeti

universe u

/-! ## Layer 4: Centralisers of semisimple elements in reductive groups -/

/-- **Centralisers of semisimple elements are reductive** (4.1 (a)). Let `G` be a connected
reductive group over an algebraically closed field `k`, with coordinate Hopf algebra `H`, and let
`s ∈ G(k)` be semisimple. Then the identity component `C_G(s)°` of the centraliser of `s` is a
connected reductive group. Here `C_G(s)` is the closed subgroup of `G` cut out by the functions
vanishing at every element of `G(k)` that commutes with `s`. -/
theorem reductive_identityComponent_centralizer {k : Type u} [Field k] [IsAlgClosed k]
    (H : FiniteTypeCommHopfAlgCat.{u, u} k) (hH : reductiveCommHopfAlgProperty k H)
    (s : WithConv (H →ₐ[k] k)) (hs : HopfAlgebra.IsSemisimplePoint s) :
    reductiveCommHopfAlgProperty k
      (FiniteTypeCommHopfAlgCat.identityComponent
        (FiniteTypeCommHopfAlgCat.quotient H
          (HopfIdeal.vanishingIdeal (Subgroup.centralizer {s})))) := by
  sorry

/-- **Steinberg's connectedness theorem** (4.1 (c)). Let `G` be a connected reductive group over
an algebraically closed field `k`, with coordinate Hopf algebra `H`, whose derived group is simply
connected, and let `s ∈ G(k)` be semisimple. Then the centraliser `C_G(s)` is connected. Here the
derived group is the scheme-theoretic derived subgroup, which is semisimple, and `C_G(s)` is the
closed subgroup of `G` cut out by the functions vanishing at every element of `G(k)` that commutes
with `s`. Writing `s = zs′` with `z` in the connected centre `Z°` and `s′` in the derived group,
`C_G(s) = Z°·C_{G^der}(s′)`, and `C_{G^der}(s′)` is connected by Steinberg's theorem for simply
connected semisimple groups (Steinberg, *Endomorphisms of linear algebraic groups*, Theorem 8.1). -/
theorem geometricallyConnected_centralizer_of_simplyConnected {k : Type u} [Field k]
    [IsAlgClosed k] (H : FiniteTypeCommHopfAlgCat.{u, u} k)
    (hH : reductiveCommHopfAlgProperty k H)
    (hder : simplyConnectedSemisimpleCommHopfAlgProperty k
      ⟨FiniteTypeCommHopfAlgCat.quotient H (CommHopfAlgCat.derivedDefiningIdeal H.obj),
        hH.semisimple_derived⟩)
    (s : WithConv (H →ₐ[k] k)) (hs : HopfAlgebra.IsSemisimplePoint s) :
    geometricallyConnectedCommHopfAlgProperty k
      (FiniteTypeCommHopfAlgCat.quotient H
        (HopfIdeal.vanishingIdeal (Subgroup.centralizer {s}))).obj := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.OrbitMeasuresOnAdelicGroups
