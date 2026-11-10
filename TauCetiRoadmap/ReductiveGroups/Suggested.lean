import Mathlib
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.LinearlyReductive
import TauCeti.Algebra.AlgebraicGroup.Unipotent.Radical.Construction
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Coinvariants.Basic
import TauCeti.Algebra.AlgebraicGroup.Connected.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.Connected.GroupScheme
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Maximal
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
import TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.Borel.Basic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Points.Basic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Normal.Basic
import TauCeti.Algebra.AlgebraicGroup.Fppf.Quotient.Homogeneous.Coinvariants
import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Normalizer.Character
import TauCeti.Algebra.HopfAlgebra.HopfIdeal.Kernel
import TauCeti.GroupTheory.TitsSystem.Basic
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import TauCeti.GroupTheory.Coxeter.Artin
import TauCeti.LinearAlgebra.RootSystem.Coxeter.Matrix

/-!
# Reductive algebraic groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each admitted with `sorry`.

Stated here, because every carrier exists at the pins: Layer 3's quotient theorem for a normal
closed subgroup of a finite-type affine group over a field, nonreduced groups included, as the
representing coinvariant algebra together with faithful flatness; Layer 6's characteristic-zero
criterion that an affine group is linearly reductive exactly when its identity component is
reductive, and Nagata's criterion that over a field of characteristic `p` a smooth
geometrically connected group is linearly reductive exactly when it is a torus; Layer 6A's characteristic-zero Levi complement, as a Hopf
ideal whose quotient restricts to an isomorphism from the right coinvariants of the unipotent
radical's defining ideal; Layer 7's conjugacy of maximal tori by rational points over an
algebraically closed field, for every finite-type affine group, its Bruhat decomposition of a
split reductive group over an arbitrary field in Tits-system form, and its Levi decomposition of a
parabolic subgroup of a connected reductive group over an arbitrary field, in the same
coinvariant form as Layer 6A's; Layer 7a's Lang surjectivity for smooth geometrically connected
groups over finite fields; Layer 11A's plane-configuration fundamental-group/braid-group
equivalence, sending half-twist loops to the standard generators; and Layer 11B's finite
Weyl-arrangement theorem, on the orbit space of the root-hyperplane complement in an arbitrary
finite-dimensional complex coroot space under Mathlib's Weyl group of the root pairing, with the
two definitions it needs.

Proved in the pinned Tau Ceti, hence consumed and not restated: Layer 3's representability of
the quotient by a normal closed subgroup of a geometrically reduced group,
`TauCeti.CommHopfAlgCat.coinvariantsFppfQuotientIso`; Layer 3A's orbit theorems
(locally closed geometric orbits in `TauCeti.SchemeAction.isLocallyClosed_orbit`, the locally
closed orbit scheme `TauCeti.SchemeAction.orbitScheme`, the boundary bound
`TauCeti.SchemeAction.topologicalKrullDim_orbitBoundary_lt` and the closed orbits
`TauCeti.SchemeAction.exists_isClosed_orbit_subset_orbitClosure` and
`TauCeti.SchemeAction.exists_isClosed_orbit`); Layer 6's characteristic-zero implication from
reductivity to linear reductivity, `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive`,
and its equivalence with linear reductivity for geometrically connected groups,
`TauCeti.reductiveCommHopfAlgProperty_iff_linearlyReductive`;
Layer 4's Jordan decomposition of the points of an affine group over a perfect extension,
`TauCeti.HopfAlgebra.Point.jordanDecomposition`, and its anti-equivalence of tori over a perfect
field with Galois lattices, `TauCeti.TorusCommHopfAlgCat.characterLatticeFunctor_isEquivalence`,
the exactness of the diagonalizable-group functor in both directions,
`TauCeti.DiagonalizableGroup.isShortExact_mapDomainBialgHom_iff`, and the classification of
homomorphisms into a group of multiplicative type over a perfect field,
`TauCeti.multiplicativeTypeCommHopfAlgProperty.existsUnique_geometricCharacterMap_eq`;
Layer 6B's affine direction of Matsushima's criterion,
`TauCeti.HopfIdeal.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive`; Layer 7's
conjugacy of Borel subgroups, `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq`;
Layer 9A's signed Lie algebra of an ADE lattice over `ℤ` with its Jacobi identity and Serre
presentation, `Matrix.ShellLieAlgebra.lieRing` and `Matrix.ShellLieAlgebra.serreLift_surjective`,
and the folded Serre frame of a diagram automorphism,
`Matrix.ShellLieAlgebra.isSerreSystem_folded`; and Layer 9B's special isogenies of the short-root
`G₂` and `F₄` carriers, `TauCeti.G2ShortRoot.PrimeField.specialIsogenyHom_comp_self` and
`TauCeti.F4ShortRoot.PrimeField.specialIsogenyHom_comp_self`.

Not statable at the pins, hence not stated, with the missing carrier named:
* Layers 0–1: the category of rational algebraic group representations and its comparison
  functors with comodules. The native Hopf/points dictionary, the embedding theorem
  (`TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`) and the Tannakian
  reconstruction of the points functor are supplied, so Layer 1 states no theorem here.
* Layers 7 and 9D: the represented quotient `G/P` by a parabolic subgroup and the root datum
  extracted from a group lack the required comparison carriers. The parabolic predicate is a
  Tau Ceti declaration
  (`TauCeti.HopfIdeal.IsParabolic`, `TauCeti.HopfIdeal.IsParabolicOverAlgClosed`, in the module
  `TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic`), so Layer 7's completeness characterization
  of parabolics lacks only the represented quotient.
  The relative structure theorems of Layer 9D over a base ring lack the centre of an affine
  group scheme over that ring: the pinned `TauCeti.CommHopfAlgCat.centerDefiningIdeal` is
  constructed over a field.
  Diagonalizable group schemes and their equivalence with finitely generated
  commutative groups exist in `TauCeti.DiagonalizableGroup.DiagonalizableGroupSchemeCat` and
  `TauCeti.DiagonalizableGroup.schemeEquivalence`; they are supplied, not targets here. The
  native k-unipotent radical, its scheme inclusion and the represented quotient of a
  geometrically reduced group by a normal subgroup (`TauCeti.CommHopfAlgCat.coinvariants`) are
  supplied as well.
* Layers 7c–7f: the Harish–Chandra biadjunction, the permutation-bimodule Mackey
  decomposition, common-Levi independence and the Gassmann application. The parabolic
  predicate (`TauCeti.HopfIdeal.IsParabolic`) and the `q`-Frobenius on the points of a
  finite-field form (`TauCeti.FiniteField.frobeniusPoints`) are Tau Ceti declarations; the
  missing carrier is
  an `F`-stable Levi complement of an `F`-stable parabolic subgroup, as a closed subgroup
  scheme. The pinned dynamic decomposition `TauCeti.Cocharacter.leviDecompositionMulEquiv` is
  a statement about the point subgroups of one cocharacter over one value algebra and carries
  no Frobenius-stability datum.
* Layer 9E: Lang–Steinberg surjectivity for a Steinberg endomorphism. The missing carrier is an
  `𝔽_q′`-structure on the group whose `q′`-Frobenius is a positive power of the endomorphism;
  the pinned `TauCeti.FiniteField.frobeniusPoints` is the `q^n`-Frobenius of a given
  `𝔽_q`-form, and `TauCeti.Bialgebra.iterateFrobeniusPoints` the `p^n`-power endomorphism of
  the points of a fixed integral Hopf algebra, not an endomorphism with such a power.
* Layer 9: a pinned reductive group with its extracted root datum, and the full-root-datum
  Chevalley realization and its ordered PBW family (the native Kostant subring alone does not
  specify these). The pinned `TauCeti.Pinning` indexes its root-space trivializations by the
  simple roots read off from the group, and root data are extracted only for specific matrix
  groups, so the canonical pinned model of an arbitrary root datum and its change-of-data
  isomorphisms are not stated.
* Layer 10: rational highest-weight modules, Weyl and induced modules, and their distribution
  actions on the constructed group.
* Layer 11: the regular-semisimple Lie locus, its Weyl quotient and the comparison with based
  spectral monodromy; the missing carrier is the invariant adjoint quotient `𝔤 → 𝔤//G` of the
  complex Lie algebra, which Layer 11C constructs. Layer 11A's equivalence
  below is stated on the actual configuration quotient and characterized on the explicit
  half-twist loops; its covering-permutation refinement additionally needs the covering
  monodromy comparison.
* Layer 3A.5f: the complex orbit comparison `G(ℂ)/H(ℂ) ≃ O_x(ℂ)`. The classical topology on
  complex points is pinned (`TauCeti.SchemePointTopology.topology`,
  `TauCeti.PointTopology.topology`); the missing carriers are the smooth charts on complex points
  and the complex Lie-group structure on `G(ℂ)`, which Layer 3A.5d and 3A.5e construct.
-/

namespace TauCetiRoadmap.ReductiveGroups

namespace StructureAcceptance

universe v

/-! ## Layer 3: quotients by normal closed subgroups -/

/-- Quotients by normal subgroup schemes, nonreduced groups included. Let `G = Spec O(G)` be an
affine group of finite type over a field `k` and `N` the closed subgroup cut out by a normal Hopf
ideal `I`, and let `O(G)^N` be the subalgebra of right `I`-coinvariants. The map from the fppf
homogeneous quotient `G/N` to the fppf sheaf of points of `Spec O(G)^N`, induced by restricting
points of `G` to `O(G)^N`, is an isomorphism, so `G/N` is represented by the affine group
`Spec O(G)^N`; and `O(G)` is faithfully flat over `O(G)^N` (Milne, Algebraic Groups (2017),
Theorem 5.14, p. 102, Proposition 5.18, p. 103, and Propositions 5.21 and 5.25, pp. 104–105). The
pinned `TauCeti.CommHopfAlgCat.coinvariantsFppfQuotientIso` assumes `O(G)` geometrically
reduced; here `μ_p ⊂ μ_{p²}` in characteristic `p` is included, with quotient `μ_p` through
`t ↦ t^p`. -/
theorem isIso_coinvariantsQuotient_of_isNormal {k : Type v} [Field k]
    {H : _root_.CommHopfAlgCat.{v} k} [Algebra.FiniteType k H]
    (I : TauCeti.HopfIdeal k H) (hI : I.IsNormal) :
    CategoryTheory.IsIso I.fppfHomogeneousQuotientToCoinvariantsPoints ∧
      I.coinvariants.val.toRingHom.FaithfullyFlat := by
  sorry

/-! ## Layer 6: reductive and linearly reductive groups -/

/-- In characteristic zero an affine group `G` of finite type is linearly reductive exactly when
its identity component is reductive: every finite-dimensional comodule over its coordinate Hopf
algebra is completely reducible if and only if `G°`, which is smooth by Cartier's theorem, has
trivial geometric unipotent radical (Milne, Algebraic Groups, Corollary 22.43, p. 478). The
identity component is taken after extension to an algebraic closure `k̄`, where the native
identity component is defined; `(G_k̄)° = (G°)_k̄` and reductivity is a geometric condition. The
group need not be connected. The characteristic hypothesis is needed: the constant group `ℤ/p` in
characteristic `p` has trivial identity component and is not linearly reductive. -/
theorem linearlyReductive_iff_reductive_identityComponent {k : Type v} [Field k] [CharZero k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k) :
    TauCeti.linearlyReductiveCommHopfAlgProperty k H.obj ↔
      TauCeti.reductiveCommHopfAlgProperty (AlgebraicClosure k)
        (TauCeti.FiniteTypeCommHopfAlgCat.identityComponent
          ((TauCeti.FiniteTypeCommHopfAlgCat.baseChangeFunctor
            (K := AlgebraicClosure k)).obj H)) := by
  sorry

/-- Nagata's theorem. Over a field of characteristic `p > 0`, a smooth geometrically connected
affine group of finite type is linearly reductive exactly when it is a torus, a group that
becomes a split torus over an algebraic closure (M. Kohls, A user friendly proof of Nagata's
characterization of linearly reductive groups in positive characteristics, Linear Multilinear
Algebra 59 (2011), 271–278, for the smooth case over an algebraically closed field; Milne,
Algebraic Groups (2017), Remark 12.56, p. 249, states the theorem without proof, and
Proposition 12.54, p. 248, proves the commutative case, its footnote recording that linear
reductivity is insensitive to extension of the base field). Both sides are geometric: linear
reductivity descends from and extends to an algebraic closure, and the torus property is defined
there, so no algebraic closedness is assumed. Smoothness is needed: `μ_p` is linearly reductive
and connected but not a torus, and it refutes the 2017 printing of Remark 12.56, which omits
smoothness. Geometric connectedness is needed: the constant group `ℤ/ℓ` for a prime `ℓ ≠ p` is
linearly reductive and not a torus. -/
theorem linearlyReductive_iff_torus {k : Type v} [Field k]
    (p : ℕ) [Fact p.Prime] [CharP k p]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hsm : Algebra.Smooth k H)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj) :
    TauCeti.linearlyReductiveCommHopfAlgProperty k H.obj ↔
      TauCeti.torusCommHopfAlgProperty k H := by
  sorry

/-! ## Layer 6A: characteristic-zero Levi complements -/

/-- Mostow's theorem. Over a field of characteristic zero, a smooth geometrically connected
finite-type affine group `G` has a Levi complement: a closed subgroup `L` mapping isomorphically
onto `Q = G/R_u(G)`. In coordinates: with `I_u` the defining Hopf ideal of the `k`-unipotent
radical (the geometric unipotent radical, as `k` is perfect), `O(Q)` is the subalgebra of right
`I_u`-coinvariants of `O(G)`, and `L` is cut out by a Hopf ideal `J` for which the composite
`O(Q) → O(G) → O(G)/J = O(L)` is bijective (McNinch, Levi decompositions of a linear algebraic
group, §3.1, p. 6). For reductive `G` the ideal `J = 0` works; for unipotent `G` the
augmentation ideal works. The characteristic hypothesis is needed: in characteristic `p` the Greenberg
transform of `SL₂` over the length-two Witt vectors has no Levi complement (McNinch, (3.2.1),
p. 7). -/
theorem exists_levi_complement {k : Type v} [Field k] [CharZero k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hsm : Algebra.Smooth k H)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj) :
    ∃ J : TauCeti.HopfIdeal k H,
      Function.Bijective
        ((Ideal.Quotient.mkₐ k J.toIdeal).comp
          (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal H).coinvariants.val) := by
  sorry

/-! ## Layer 7: maximal tori and Levi decompositions of parabolic subgroups -/

/-- Over an algebraically closed field `k`, any two maximal tori of a finite-type affine group
`G` are conjugate by a rational point: if the Hopf ideals `I` and `J` cut out maximal tori `T`
and `T'`, then `g T g⁻¹ = T'` for some `g ∈ G(k)`, that is `I.conjugate g = J` (Milne, Algebraic
Groups, Theorem 17.10, p. 354, for smooth connected `G`). No smoothness or connectedness is
assumed: a torus is smooth and connected, so the tori of `G` are those of the smooth connected
subgroup `(G_red)°` (Milne, Corollary 1.39, p. 18), whose rational points are rational points
of `G`. The pinned `TauCeti.HopfIdeal.exists_conjugate_eq_of_isMaximalTorus` assumes in addition
that both tori can be conjugated into a fixed maximal torus. The field must be algebraically
closed: over `ℝ` the diagonal torus and `SO₂` are maximal tori of `SL₂` that no real point
conjugates into each other. -/
theorem exists_conjugate_eq_of_isMaximalTorus {k : Type v} [Field k] [IsAlgClosed k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k) {I J : TauCeti.HopfIdeal k H.obj}
    (hI : TauCeti.HopfIdeal.IsMaximalTorus k H.obj I)
    (hJ : TauCeti.HopfIdeal.IsMaximalTorus k H.obj J) :
    ∃ g : WithConv (H.obj →ₐ[k] k), I.conjugate g = J := by
  sorry

/-- The Bruhat decomposition of a split reductive group, in Tits-system form, over every field.
Let `G` be a connected reductive group over a field `k` and `T` a split maximal torus, presented
by a surjective bialgebra map `π : O(G) → k[X]` onto the group algebra of its character group,
and let `B = V(I) ⊇ T` be a Borel subgroup. Then `B(k)` and the rational points `N_G(T)(k)` of the
scheme normalizer of `T` form a Tits system in `G(k)`, whose Weyl group `N_G(T)(k)/T(k)` is
`W(G, T)` (Milne, Algebraic Groups (2017), Example 21.47, p. 439, and Proposition 21.75, p. 448);
`TauCeti.TitsSystem.existsUnique_mem_bruhatCell` then gives `G(k) = ⨆_{w ∈ W} B(k) w B(k)`
(Milne, Theorem 21.45, p. 438). Over an algebraically closed field every maximal torus is split
and `N_G(T)(k)` is the normalizer of `T(k)` in `G(k)`. Over a small field the scheme normalizer is
needed: over `𝔽₂` the diagonal torus of `GL₂` has trivial rational points, whose normalizer in
`GL₂(𝔽₂)` is the whole group, in which `B(𝔽₂)`, of order two, is not normal. Containment `T ⊆ B`
is needed: over an algebraically closed field, for `B` upper triangular in `GL₂` and `T` the
conjugate of the diagonal torus by `[[1,0],[1,1]]`, the intersection `B(k) ∩ N_G(T)(k)` is not
normal in `N_G(T)(k)`. -/
theorem exists_titsSystem_of_isBorel {k : Type v} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hG : TauCeti.reductiveCommHopfAlgProperty k H)
    {X : Type v} [CommGroup X] (π : H.obj →ₐc[k] MonoidAlgebra k X)
    (hπ : Function.Surjective π)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus k H.obj (TauCeti.HopfIdeal.kerOfSurjective π hπ))
    {I : TauCeti.HopfIdeal k H.obj} (hB : TauCeti.HopfIdeal.IsBorel k H.obj I)
    (hTB : I ≤ TauCeti.HopfIdeal.kerOfSurjective π hπ) :
    ∃ S : TauCeti.TitsSystem (WithConv (H.obj →ₐ[k] k)),
      S.subgroupB = TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj I (CommAlgCat.of k k) ∧
        S.subgroupN = BialgHom.normalizerPoints π hπ := by
  sorry

/-- Levi decomposition of a parabolic subgroup over an arbitrary field. Let `G` be a connected
reductive group over `k` and `P = V(I)` a parabolic `k`-subgroup, a smooth closed subgroup whose
base change to `k̄` contains a Borel subgroup. The `k`-unipotent radical `U` of `P` is the
descended geometric unipotent radical, and `P` has a Levi `k`-subgroup `L` with `P = L ⋉ U`
(Conrad–Feng, *Reductive Groups over Fields*, §H.1 and Example H.1.2, p. 238). In coordinates, as
in Layer 6A's complement: with `I_u` the defining Hopf ideal of `U`, `O(P/U)` is the subalgebra of
right `I_u`-coinvariants of `O(P)`, and `L` is cut out by a Hopf ideal `J` of `O(P)` for which the
composite `O(P/U) → O(P) → O(P)/J = O(L)` is bijective. No characteristic hypothesis is needed,
unlike Layer 6A: parabolic subgroups of reductive groups are the dynamic subgroups `P_G(λ)`, with
Levi factor `Z_G(λ)`. For the upper triangular Borel subgroup of `GL₂` the radical is
`{1 + a E₁₂}` and the ideal of the diagonal torus works; for `P = G` the radical is trivial and
`J = 0` works. -/
theorem exists_levi_complement_of_isParabolic {k : Type v} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hG : TauCeti.reductiveCommHopfAlgProperty k H)
    {I : TauCeti.HopfIdeal k H.obj} (hP : TauCeti.HopfIdeal.IsParabolic k H.obj I) :
    ∃ J : TauCeti.HopfIdeal k (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I),
      Function.Bijective
        ((Ideal.Quotient.mkₐ k J.toIdeal).comp
          (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal
            (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)).coinvariants.val) := by
  sorry

/-! ## Layer 7a: finite-field Lang surjectivity -/

/-- For a smooth geometrically connected finite-type affine group over a finite field,
the Lang map for q-power Frobenius is surjective on points over every algebraically closed
extension (Milne, Algebraic Groups, Theorem 17.96 and Corollary 17.97, p. 383): every point `x`
is `g⁻¹ F(g)`, where `F(g)` is `g` followed by the `q`-power Frobenius `F` of the coefficient
field. The source writes the map as `g ↦ g F(g)⁻¹`; inverting the input converts one convention
into the other. The value equation specifies Frobenius on the coefficient field, the map that the
pinned `TauCeti.FiniteField.frobeniusPoints k 1` applies to points; no reductivity or split-form
hypothesis is imposed. Geometric connectedness is needed: on the constant group `ℤ/2` the map is
constant with value `1`. Algebraic closedness of the extension is needed: on `𝔾_a` over the
field `k` itself the map is `x ↦ x^q − x`, which is zero. -/
theorem lang_surjective {k : Type v} [Field k] [Finite k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hsm : Algebra.Smooth k H)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj)
    {K : Type v} [Field K] [Algebra k K] [IsAlgClosed K]
    (F : K →ₐ[k] K) (hF : ∀ a : K, F a = a ^ Nat.card k) :
    Function.Surjective (fun g : WithConv (H →ₐ[k] K) =>
      g⁻¹ * WithConv.toConv (F.comp g.ofConv)) := by
  sorry

end StructureAcceptance

/-! ## Layer 11: plane configurations and braid groups -/

namespace PlaneBraidAcceptance

/-- Ordered configurations of distinct complex points, with the subtype topology. -/
abbrev OrderedPlane (n : ℕ) := {z : Fin n → ℂ // Function.Injective z}

/-- A permutation acts by its inverse on coordinate indices. -/
def permute {n : ℕ} (σ : Equiv.Perm (Fin n)) (z : OrderedPlane n) : OrderedPlane n :=
  ⟨fun i => z.1 (σ⁻¹ i), z.property.comp σ.symm.injective⟩

/-- The left permutation action on ordered plane configurations. -/
instance planePermutationAction (n : ℕ) : MulAction (Equiv.Perm (Fin n)) (OrderedPlane n) where
  smul := permute
  one_smul z := Subtype.ext (by funext i; rfl)
  mul_smul σ τ z := Subtype.ext (by funext i; rfl)

/-- Unordered configurations carry the orbit quotient topology. -/
abbrev UnorderedPlane (n : ℕ) :=
  Quotient (MulAction.orbitRel (Equiv.Perm (Fin n)) (OrderedPlane n))

/-- The standard ordered basepoint has coordinates 0, 1, ..., n−1. -/
def planeBase (n : ℕ) : OrderedPlane n :=
  ⟨fun i => (i.val : ℂ), by
    intro i j h
    apply Fin.ext
    change (i.val : ℂ) = (j.val : ℂ) at h
    exact_mod_cast h⟩

/-- The unordered basepoint is the orbit of the standard ordered basepoint. -/
def unorderedBase (n : ℕ) : UnorderedPlane n := Quotient.mk _ (planeBase n)

open Complex in
/-- The counterclockwise half-twist at time `t`: the points `i` and `i + 1` of the standard
configuration turn through the angle `π t` about their midpoint `i + 1/2`, the other points
staying fixed. -/
noncomputable def halfTwist (n : ℕ) (i : Fin (n - 1)) (t : ℝ) : Fin n → ℂ := fun k =>
  if k = TauCeti.BraidGroup.strand (n := n) i then
    ((i : ℕ) : ℂ) + 1 / 2 - exp ((Real.pi * t : ℝ) * I) / 2
  else if k = TauCeti.BraidGroup.strandSucc (n := n) i then
    ((i : ℕ) : ℂ) + 1 / 2 + exp ((Real.pi * t : ℝ) * I) / 2
  else ((k : ℕ) : ℂ)

open Complex in
/-- The half-twist configurations are configurations of distinct points: the two moving points
stay at distance `1/2` from `i + 1/2` on opposite sides, while every other point is an integer
at distance at least `3/2` from it. -/
theorem halfTwist_injective (n : ℕ) (i : Fin (n - 1)) (t : ℝ) :
    Function.Injective (halfTwist n i t) := by
  set s := TauCeti.BraidGroup.strand (n := n) i
  set s' := TauCeti.BraidGroup.strandSucc (n := n) i
  set m : ℂ := ((i : ℕ) : ℂ) + 1 / 2
  set E : ℂ := exp ((Real.pi * t : ℝ) * I)
  have hE : ‖E‖ = 1 := norm_exp_ofReal_mul_I _
  have hss' : s ≠ s' := TauCeti.BraidGroup.strand_ne_strandSucc i
  have hfar : ∀ k : Fin n, k ≠ s → k ≠ s' → (3 : ℝ) / 2 ≤ ‖((k : ℕ) : ℂ) - m‖ := by
    intro k h1 h2
    have h1' : (k : ℕ) ≠ i := fun h => h1 (Fin.ext (by simpa [s] using h))
    have h2' : (k : ℕ) ≠ i + 1 := fun h => h2 (Fin.ext (by simpa [s'] using h))
    have hc : ((k : ℕ) : ℂ) - m = (((k : ℝ) - i - 1 / 2 : ℝ) : ℂ) := by
      simp only [m]; push_cast; ring
    rw [hc, Complex.norm_real, Real.norm_eq_abs]
    rcases Nat.lt_or_gt_of_ne h1' with h | h
    · have hk : (k : ℝ) + 1 ≤ i := by exact_mod_cast h
      rw [abs_of_neg (by linarith)]; linarith
    · have hk : (i : ℝ) + 2 ≤ k := by exact_mod_cast (show (i : ℕ) + 2 ≤ k by omega)
      rw [abs_of_pos (by linarith)]; linarith
  have hval : ∀ k : Fin n, (k = s ∧ halfTwist n i t k = m - E / 2) ∨
      (k = s' ∧ halfTwist n i t k = m + E / 2) ∨
      (k ≠ s ∧ k ≠ s' ∧ halfTwist n i t k = ((k : ℕ) : ℂ)) := by
    intro k
    by_cases h1 : k = s
    · exact Or.inl ⟨h1, by simp [halfTwist, h1, s, m, E]⟩
    · by_cases h2 : k = s'
      · exact Or.inr (Or.inl ⟨h2, by simp [halfTwist, h2, hss'.symm, s, s', m, E]⟩)
      · exact Or.inr (Or.inr ⟨h1, h2, by simp [halfTwist, h1, h2, s, s']⟩)
  have hhalf : ‖E / 2‖ = 1 / 2 := by rw [norm_div, hE]; norm_num
  intro a b hab
  rcases hval a with ⟨ha, hza⟩ | ⟨ha, hza⟩ | ⟨ha1, ha2, hza⟩ <;>
    rcases hval b with ⟨hb, hzb⟩ | ⟨hb, hzb⟩ | ⟨hb1, hb2, hzb⟩ <;>
    rw [hza, hzb] at hab
  · exact ha.trans hb.symm
  · have : E = 0 := by linear_combination -hab
    simp [this] at hE
  · have := hfar b hb1 hb2
    rw [← hab, show m - E / 2 - m = -(E / 2) by ring, norm_neg, hhalf] at this
    norm_num at this
  · have : E = 0 := by linear_combination hab
    simp [this] at hE
  · exact ha.trans hb.symm
  · have := hfar b hb1 hb2
    rw [← hab, show m + E / 2 - m = E / 2 by ring, hhalf] at this
    norm_num at this
  · have := hfar a ha1 ha2
    rw [hab, show m - E / 2 - m = -(E / 2) by ring, norm_neg, hhalf] at this
    norm_num at this
  · have := hfar a ha1 ha2
    rw [hab, show m + E / 2 - m = E / 2 by ring, hhalf] at this
    norm_num at this
  · exact Fin.ext (by exact_mod_cast hab)

open Complex in
/-- The based loop of unordered configurations traced by the half-twist of the points `i` and
`i + 1`: at time `1` the two points have exchanged places, so the loop closes up in the
quotient by the permutation action. -/
noncomputable def halfTwistLoop (n : ℕ) (i : Fin (n - 1)) :
    Path (unorderedBase n) (unorderedBase n) where
  toFun t := Quotient.mk _ ⟨halfTwist n i t, halfTwist_injective n i t⟩
  continuous_toFun := by
    refine continuous_quotient_mk'.comp (Continuous.subtype_mk (continuous_pi fun k => ?_) _)
    by_cases h1 : k = TauCeti.BraidGroup.strand (n := n) i
    · simp only [halfTwist, h1, ite_true]
      fun_prop
    · by_cases h2 : k = TauCeti.BraidGroup.strandSucc (n := n) i
      · simp only [halfTwist, h2, (TauCeti.BraidGroup.strand_ne_strandSucc i).symm, ite_true,
          ite_false]
        fun_prop
      · simp only [halfTwist, h1, h2, ite_false]
        fun_prop
  source' := by
    show (Quotient.mk _ _ : UnorderedPlane n) = Quotient.mk _ (planeBase n)
    congr 1
    apply Subtype.ext
    funext k
    simp only [halfTwist, planeBase, Set.Icc.coe_zero, mul_zero, Complex.ofReal_zero,
      zero_mul, Complex.exp_zero]
    split_ifs with h1 h2
    · subst h1; simp
    · subst h2; push_cast [TauCeti.BraidGroup.val_strandSucc]; ring
    · rfl
  target' := by
    show (Quotient.mk _ _ : UnorderedPlane n) = Quotient.mk _ (planeBase n)
    apply Quotient.sound
    show _ ∈ MulAction.orbit _ _
    refine ⟨Equiv.swap (TauCeti.BraidGroup.strand (n := n) i)
      (TauCeti.BraidGroup.strandSucc (n := n) i), ?_⟩
    apply Subtype.ext
    funext k
    change (planeBase n).1 ((Equiv.swap _ _)⁻¹ k) = halfTwist n i (1 : unitInterval) k
    simp only [halfTwist, planeBase, Equiv.swap_inv, Equiv.swap_apply_def, Set.Icc.coe_one,
      mul_one, Complex.exp_pi_mul_I]
    split_ifs with h1 h2
    · push_cast [TauCeti.BraidGroup.val_strandSucc]; ring
    · push_cast [TauCeti.BraidGroup.val_strand]; ring
    · rfl

/-- The fundamental group of the actual unordered plane configuration space is the native
Artin braid group, by the isomorphism sending the class of the `i`-th counterclockwise
half-twist loop to the generator `σᵢ` (Fox–Neuwirth, §7, pp. 122–126; Birman–Brendle, §1.2,
pp. 4–5). -/
theorem plane_braid (n : ℕ) :
    ∃ e : FundamentalGroup (UnorderedPlane n) (unorderedBase n) ≃* TauCeti.BraidGroup n,
      ∀ i : Fin (n - 1),
        e (FundamentalGroup.fromPath (Path.Homotopic.Quotient.mk (halfTwistLoop n i))) =
          TauCeti.BraidGroup.sigma i := by
  sorry

end PlaneBraidAcceptance

/-! ## Layer 11B: the finite Weyl-arrangement theorem -/

namespace ReflectionArrangementAcceptance

variable {ι M N : Type*} [AddCommGroup M] [Module ℂ M] [AddCommGroup N] [Module ℂ N]

/-- The complement of the root hyperplanes in the coroot space `N`: the points `x` with
`⟨α_i, x⟩ ≠ 0` for every root `α_i`, with the subspace topology. -/
abbrev RegularCoroots (P : RootPairing ι ℂ M N) :=
  {x : N // ∀ i, P.toLinearMap (P.root i) x ≠ 0}

/-- The orbit space of the root-hyperplane complement under the Weyl group, with the quotient
topology. The Weyl group is Mathlib's `P.weylGroup`, acting on the coroot space through the
native action of its opposite group, the action underlying `RootPairing.weylGroupCorootRep`;
its image in the linear automorphisms is the subgroup generated by the coreflections
`y ↦ y − ⟨α_i, y⟩ α_i^∨` (`RootPairing.range_weylGroup_coweightHom`). -/
abbrev RegularOrbits (P : RootPairing ι ℂ M N) :=
  Quotient ((MulAction.orbitRel P.weylGroup.op N).comap
    (Subtype.val : RegularCoroots P → N))

/-- Brieskorn's theorem for finite Weyl arrangements. For a finite reduced crystallographic root
pairing `P` over `ℂ` whose coroot space `N` is finite-dimensional, with its module topology, and
a base `b`, the fundamental group of the orbit space under the Weyl group of the complement of
the root hyperplanes in the coroot space, at the class of any regular point, is the Artin group
of the Coxeter matrix of `b` (Brieskorn, Die Fundamentalgruppe des Raumes der regulären Orbits
einer endlichen komplexen Spiegelungsgruppe, Invent. Math. 12 (1971), Satz, p. 57, for finite
real reflection groups, restated in Sur les groupes de tresses, Séminaire Bourbaki exposé 401,
Proposition 1, p. 25; Ernst, Cell Complexes for Arrangements with Group Actions, Theorem 6.10,
p. 46). On the spans of its roots and coroots `P` is the complexification of its rational form,
a product of root pairings gives a product of orbit spaces, and the subspace on which every root
vanishes is a contractible factor fixed by the Weyl group. Applied to `P.flip` it gives the same
statement for the complement of the coroot hyperplanes in the root space. For the root pairing
`±2`, `±1` on `ℂ` the orbit space is `ℂ*/±1 ≅ ℂ*` and both groups are `ℤ`; with no roots both
groups are trivial. -/
theorem nonempty_mulEquiv_artinGroup [TopologicalSpace N] [IsModuleTopology ℂ N]
    [FiniteDimensional ℂ N]
    (P : RootPairing ι ℂ M N) [Finite ι] [P.IsCrystallographic] [P.IsReduced]
    (b : P.Base) (x : RegularCoroots P) :
    Nonempty (FundamentalGroup (RegularOrbits P) (Quotient.mk _ x) ≃*
      TauCeti.ArtinGroup (TauCeti.coxeterMatrixOfBase P b)) := by
  sorry

end ReflectionArrangementAcceptance

end TauCetiRoadmap.ReductiveGroups
