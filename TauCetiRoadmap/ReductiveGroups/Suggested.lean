import Mathlib
import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.LinearlyReductive
import TauCeti.Algebra.AlgebraicGroup.Unipotent.Radical.Construction
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Coinvariants.Basic
import TauCeti.Algebra.AlgebraicGroup.Connected.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.Connected.GroupScheme
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic

/-!
# Reductive algebraic groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each admitted with `sorry`.

Stated here, because every carrier exists at the pins: Layer 6's characteristic-zero criterion
that an affine group is linearly reductive exactly when its identity component is reductive, and
Nagata's characteristic-`p` criterion that a smooth connected group is linearly reductive exactly
when it is a torus; Layer 6A's characteristic-zero Levi complement, as a Hopf ideal whose quotient
restricts to an isomorphism from the right coinvariants of the unipotent radical's defining
ideal; Layer 7a's Lang surjectivity for smooth geometrically connected groups over finite fields;
the SL coordinate presentation of the worked examples; Layer 11A's plane-configuration
fundamental-group/braid-group equivalence, sending half-twist loops to the standard generators,
and permutation-map nonsplitting.

Proved in the pinned Tau Ceti, hence consumed and not restated: Layer 3's representability of
the quotient by a normal closed subgroup of a geometrically reduced group,
`TauCeti.CommHopfAlgCat.coinvariantsFppfQuotientIso`; Layer 3A's orbit theorems
(locally closed geometric orbits in `TauCeti.SchemeAction.isLocallyClosed_orbit`, the locally
closed orbit scheme `TauCeti.SchemeAction.orbitScheme`, the boundary bound
`TauCeti.SchemeAction.topologicalKrullDim_orbitBoundary_lt` and the closed orbits
`TauCeti.SchemeAction.exists_isClosed_orbit_subset_orbitClosure` and
`TauCeti.SchemeAction.exists_isClosed_orbit`); Layer 6's characteristic-zero implication from
reductivity to linear reductivity, `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive`;
Layer 6B's affine direction of Matsushima's criterion,
`TauCeti.HopfIdeal.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive`; and
Layer 7's conjugacy of Borel subgroups,
`TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq`.

Not statable at the pins, hence not stated, with the missing carrier named:
* Layers 0–1: the category of rational algebraic group representations and its comparison
  functors with comodules. The native Hopf/points dictionary, the embedding theorem
  (`TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`) and the Tannakian
  reconstruction of the points functor are supplied, so Layer 1 states no theorem here.
* Layers 4, 7 and 9D: the nonsplit torus/Galois-lattice comparison, the represented quotient
  `G/P` by a parabolic subgroup and the Levi subgroup functors, and the root datum extracted
  from a group lack the required comparison carriers. The parabolic predicate itself is pinned
  (`TauCeti.HopfIdeal.IsParabolic`, `TauCeti.HopfIdeal.IsParabolicOverAlgClosed`), so Layer 7's
  completeness characterization of parabolics lacks only the represented quotient.
  Diagonalizable group schemes and their equivalence with finitely generated
  commutative groups exist in `TauCeti.DiagonalizableGroup.DiagonalizableGroupSchemeCat` and
  `TauCeti.DiagonalizableGroup.schemeEquivalence`; they are supplied, not targets here. The
  native k-unipotent radical, its scheme inclusion and the represented quotient of a
  geometrically reduced group by a normal subgroup (`TauCeti.CommHopfAlgCat.coinvariants`) are
  supplied as well.
* Layers 7c–7f: the Harish–Chandra biadjunction, the permutation-bimodule Mackey
  decomposition, common-Levi independence and the Gassmann application. The parabolic
  predicate (`TauCeti.HopfIdeal.IsParabolic`) and the `q`-Frobenius on the points of a
  finite-field form (`TauCeti.FiniteField.frobeniusPoints`) are pinned; the missing carrier is
  an `F`-stable Levi complement of an `F`-stable parabolic subgroup, as a closed subgroup
  scheme. The pinned dynamic decomposition `TauCeti.Cocharacter.leviDecompositionMulEquiv` is
  a statement about the point subgroups of one cocharacter over one value algebra and carries
  no Frobenius-stability datum.
* Layer 9E: Lang–Steinberg surjectivity for a Steinberg endomorphism. The missing carrier is an
  `𝔽_q′`-structure on the group whose `q′`-Frobenius is a positive power of the endomorphism;
  the pinned `TauCeti.FiniteField.frobeniusPoints` is the `q^n`-Frobenius of a given
  `𝔽_q`-form, and `TauCeti.Bialgebra.iterateFrobeniusPoints` the `p^n`-power endomorphism of
  the points of a fixed integral Hopf algebra, not an endomorphism with such a power.
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
  state these endpoints. Layer 11A's equivalence below is stated on the actual configuration
  quotient and characterized on the explicit half-twist loops; its covering-permutation
  refinement additionally needs the covering monodromy comparison.
* Layer 3A.5: the complex orbit comparison `G(ℂ)/H(ℂ) ≃ O_x(ℂ)`. The classical topology on
  complex points is pinned (`TauCeti.SchemePointTopology.topology`,
  `TauCeti.PointTopology.topology`); the missing carrier is the smooth charts on complex points
  and the complex Lie-group structure on `G(ℂ)`, which Layer 3A.5 constructs.
-/

namespace TauCetiRoadmap.ReductiveGroups

/-! ## Layer 6: reductive and linearly reductive groups -/

namespace StructureAcceptance

universe v

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

/-- Nagata's theorem. Over an algebraically closed field of characteristic `p > 0`, a smooth
connected affine group of finite type is linearly reductive exactly when it is a torus (Milne,
Algebraic Groups, Proposition 12.54 and Remark 12.56, pp. 248–249). Smoothness is needed: `μ_p`
is linearly reductive and connected but not a torus. -/
theorem linearlyReductive_iff_torus {k : Type v} [Field k] [IsAlgClosed k]
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

/-! ## Layer 7a: finite-field Lang surjectivity -/

/-- For a smooth geometrically connected finite-type affine group over a finite field,
the Lang map for q-power Frobenius is surjective on points over every algebraically closed
extension (Milne, Algebraic Groups, Corollary 17.97, p. 383): every point `x` is `g⁻¹ F(g)`, where
`F(g)` is `g` followed by the `q`-power Frobenius `F` of the coefficient field. The value equation
specifies Frobenius on the coefficient field, the map that the pinned
`TauCeti.FiniteField.frobeniusPoints k 1` applies to points; no reductivity or split-form
hypothesis is imposed. -/
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

/-- For at least two strands, the braid permutation map has no homomorphic section:
a lifted transposition would have exponent sum both zero and odd. -/
theorem permutation_nonsplit (n : ℕ) (hn : 2 ≤ n) :
    ¬ ∃ s : Equiv.Perm (Fin n) →* TauCeti.BraidGroup n,
      (TauCeti.BraidGroup.permHom n).comp s = MonoidHom.id _ := by
  sorry

end PlaneBraidAcceptance

end TauCetiRoadmap.ReductiveGroups
