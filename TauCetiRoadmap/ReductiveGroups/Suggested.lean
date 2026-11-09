module
public import Mathlib
public import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic
public import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
public import TauCeti.Algebra.AlgebraicGroup.Torus.Maximal
public import TauCeti.Algebra.AlgebraicGroup.Unipotent.Radical.Construction
public import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Coinvariants.Basic
public import TauCeti.Algebra.AlgebraicGroup.Connected.CommHopfAlgCat
public import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
public import TauCeti.GroupTheory.SpecificGroups.Braid.Basic

/-!
# Reductive algebraic groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each admitted with `sorry`.

Stated here, because every carrier exists at the pins: Layer 6A's characteristic-zero Levi
complement, as a Hopf ideal whose quotient restricts to an isomorphism from the right
coinvariants of the unipotent radical's defining ideal; Layer 7's conjugacy of maximal tori over
an algebraically closed field; Layer 7a's Lang surjectivity for smooth geometrically connected
groups over finite fields; the SL coordinate presentation of the worked examples; and Layer 11A's
plane-configuration fundamental-group/braid-group equivalence and permutation-map nonsplitting.

Proved at the pinned Tau Ceti, hence consumed and not restated: Layer 3A's orbit geometry
(`TauCeti.SchemeAction.isLocallyClosed_orbit`, `topologicalKrullDim_orbitBoundary_lt`,
`exists_isClosed_orbit_subset_orbitClosure`, `exists_isClosed_orbit` and the reduced orbit
scheme `orbitScheme`); Layer 6's characteristic-zero implication from reductivity to linear
reductivity (`TauCeti.reductiveCommHopfAlgProperty.linearlyReductive`); Layer 6B's affine
direction of Matsushima's criterion for reductive subgroups
(`TauCeti.HopfIdeal.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive`); and
Layer 7's conjugacy of Borel subgroups (`TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq`).

Not statable at the pins, hence not stated, with the missing carrier named:
* Layers 0–1: the category of rational algebraic group representations and its comparison
  functors with comodules. The native Hopf/points dictionary, the embedding theorem
  (`TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`) and the Tannakian
  reconstruction of the points functor are supplied, so Layer 1 states no theorem here.
* Layer 3: representability of the homogeneous quotient of an affine group by an arbitrary
  closed subgroup by a (generally non-affine) scheme. The fppf homogeneous quotient sheaf
  (`CommHopfAlgCat.fppfHomogeneousQuotient`), its torsor structure and its comparison with the
  sheaf of points of `Spec` of the coinvariants exist at the pin; the sheaf of points of a
  non-affine scheme on `CommAlgCat.fppfTopology`, with which the quotient would be compared,
  is not a pinned carrier.
* Layers 4–5, 7 and 9D: the nonsplit torus/Galois-lattice comparison, represented
  quotients by unipotent radicals, parabolic and Levi subgroup functors, and the root
  datum extracted from a group lack the required comparison carriers. Diagonalizable group schemes and their equivalence
  with finitely generated commutative groups exist in
  `TauCeti.DiagonalizableGroup.DiagonalizableGroupSchemeCat` and
  `TauCeti.DiagonalizableGroup.schemeEquivalence`; they are supplied, not targets here.
  The native k-unipotent radical and its scheme inclusion also exist in
  `TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadical` and `unipotentRadicalSpecι`;
  the missing carrier here is the represented quotient and its comparison with the fppf quotient.
* Layers 7c–7f: the Harish–Chandra biadjunction, the permutation-bimodule Mackey
  decomposition, common-Levi independence and the Gassmann application. Their missing carrier
  is an `F`-stable parabolic subgroup of a finite-field form (a closed subgroup with complete
  quotient, with an `F`-stable Levi complement); the pinned dynamic decomposition
  `TauCeti.Cocharacter.leviDecompositionMulEquiv` is a statement about the point subgroups of
  one cocharacter over one value algebra and carries no Frobenius-stability datum.
* Layer 9E: Lang–Steinberg surjectivity for a Steinberg endomorphism. The missing carrier is an
  `𝔽_q′`-structure on the group whose `q′`-Frobenius is a positive power of the endomorphism;
  the pinned `TauCeti.Bialgebra.iterateFrobeniusPoints` gives only the `p^n`-power endomorphism
  of the points of a fixed integral Hopf algebra, not an endomorphism with such a power.
* Layer 9: a pinned reductive group with its extracted root datum; the full-root-datum
  Chevalley realization and its ordered PBW family (the native Kostant subring alone does not
  specify these); signed ADE cover Lie algebras and their folded fixed algebras.
* Layer 10: rational highest-weight modules, Weyl and induced modules, and their distribution
  actions on the constructed group.
* Layer 11: the regular-semisimple Lie locus, its Weyl quotient and the comparison with based
  spectral monodromy; and 11B's finite Weyl-arrangement theorem `π₁(V_reg/W) ≃ ArtinGroup`.
  For 11B the group side exists (`TauCeti.ArtinGroup`, `coxeterMatrixOfBase`,
  `rootPairingBaseChange`); the missing carrier is the `W`-action on the complexified
  root-hyperplane complement and its quotient. Bare scalar or abstract-cover surrogates do not
  state these endpoints. Layer 11A's generator and covering-permutation refinements
  additionally need the explicit half-twist paths and covering monodromy comparison;
  the existence theorem below uses the actual configuration quotient. The complex orbit
  comparison of 3A.5 needs the classical complex-point topology and smooth charts
  constructed in Layer 3A.5, and its orbit/Lie comparisons;
  these are not pinned declarations.
-/

@[expose] public section

namespace TauCetiRoadmap.ReductiveGroups

namespace StructureAcceptance

universe v

/-! ## Layer 6A: characteristic-zero Levi complements -/

/-- Mostow's theorem. Over a field of characteristic zero, a smooth geometrically connected
finite-type affine group `G` has a Levi complement: a closed subgroup `L` mapping isomorphically
onto `Q = G/R_u(G)`. In coordinates: with `I_u` the defining Hopf ideal of the `k`-unipotent
radical (the geometric unipotent radical, as `k` is perfect), `O(Q)` is the subalgebra of right
`I_u`-coinvariants of `O(G)`, and `L` is cut out by a Hopf ideal `J` for which the composite
`O(Q) → O(G) → O(G)/J = O(L)` is bijective (McNinch, Levi decompositions of a linear algebraic
group, §3.1, p. 6). The characteristic hypothesis is needed: in characteristic `p` the Greenberg
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

/-! ## Layer 7: structure theory -/

/-- **Conjugacy of maximal tori.** Over an algebraically closed field, any two maximal tori of a
finite-type affine group are conjugate by a rational point: the Hopf ideal of one is the
conjugate of the Hopf ideal of the other (Milne, Algebraic Groups (2017), Theorem 17.10, p. 354,
for a group variety that need not be connected). No smoothness or connectedness is assumed: a
torus is smooth and connected, so the maximal tori of the group are those of the identity
component of its reduction, which is a group variety because the field is perfect. -/
theorem exists_conjugate_eq_of_isMaximalTorus {k : Type v} [Field k] [IsAlgClosed k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k) {I J : TauCeti.HopfIdeal k H}
    (hI : TauCeti.HopfIdeal.IsMaximalTorus k H.obj I)
    (hJ : TauCeti.HopfIdeal.IsMaximalTorus k H.obj J) :
    ∃ g : WithConv (H →ₐ[k] k), I.conjugate g = J := by
  sorry

/-! ## Layer 7a: finite-field Lang surjectivity -/

/-- For a smooth geometrically connected finite-type affine group over a finite field,
the Lang map for q-power Frobenius is surjective on points over every algebraically closed
extension (Milne, Algebraic Groups, Corollary 17.97, p. 383). The value equation specifies
Frobenius on the coefficient field; no reductivity or split-form hypothesis is imposed. -/
theorem lang_surjective {k : Type v} [Field k] [Finite k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hsm : Algebra.Smooth k H)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj)
    {K : Type v} [Field K] [Algebra k K] [IsAlgClosed K]
    (F : K →ₐ[k] K) (hF : ∀ a : K, F a = a ^ Nat.card k) :
    Function.Surjective (fun g : WithConv (H →ₐ[k] K) =>
      g⁻¹ * AlgHom.mapValue (H := H) F g) := by
  sorry

end StructureAcceptance

/-! ## Layer 9: the special linear coordinate presentation -/

namespace SpecialLinearAcceptance

/-- The integral generic determinant minus one, including the empty determinant at rank zero. -/
noncomputable def determinantRelation (n : ℕ) : MvPolynomial (Fin n × Fin n) ℤ :=
  Matrix.det (fun i j => MvPolynomial.X (i, j)) - 1

/-- The native determinant-kernel Hopf algebra has the polynomial presentation of SL,
with its matrix coordinates identified in both directions. -/
theorem exists_coordinatePresentation (n : ℕ) :
    ∃ e : TauCeti.SpecialLinear.coordinateHopfAlgebra ℤ n ≃ₐ[ℤ]
      (MvPolynomial (Fin n × Fin n) ℤ) ⧸ Ideal.span {determinantRelation n},
      (∀ i j, e ((TauCeti.SpecialLinear.coordinateMap ℤ n).hom
          (TauCeti.GeneralLinear.genericMatrix ℤ n i j)) =
        Ideal.Quotient.mk (Ideal.span {determinantRelation n}) (MvPolynomial.X (i, j))) ∧
      (∀ i j, e.symm
          (Ideal.Quotient.mk (Ideal.span {determinantRelation n}) (MvPolynomial.X (i, j))) =
        (TauCeti.SpecialLinear.coordinateMap ℤ n).hom
          (TauCeti.GeneralLinear.genericMatrix ℤ n i j)) := by
  sorry

end SpecialLinearAcceptance

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

/-- The fundamental group of the actual unordered plane configuration space is the
native Artin braid group (Fox–Neuwirth, §7, pp. 123–126). -/
theorem nonempty_fundamentalGroup_mulEquiv_braidGroup (n : ℕ) :
    Nonempty (FundamentalGroup (UnorderedPlane n) (unorderedBase n) ≃* TauCeti.BraidGroup n) := by
  sorry

/-- For at least two strands, the braid permutation map has no homomorphic section:
a lifted transposition would have exponent sum both zero and odd. -/
theorem permutation_nonsplit (n : ℕ) (hn : 2 ≤ n) :
    ¬ ∃ s : Equiv.Perm (Fin n) →* TauCeti.BraidGroup n,
      (TauCeti.BraidGroup.permHom n).comp s = MonoidHom.id _ := by
  sorry

end PlaneBraidAcceptance

end TauCetiRoadmap.ReductiveGroups

end
