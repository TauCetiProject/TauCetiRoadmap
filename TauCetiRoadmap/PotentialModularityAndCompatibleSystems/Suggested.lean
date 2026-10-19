import Mathlib

/-!
# PotentialModularityAndCompatibleSystems: representative target signatures

The roadmap is `README.md`. These are suggested forms, not an exhaustive checklist: this file
states the light definitions and the milestones whose carriers exist at the pinned Mathlib and Tau
Ceti. The compatible-system carriers, Skolem data, rigidified Picard functors, moduli applications, deformation rings, Hecke algebras and modularity theorems are README
targets. Archimedean expressions distinguish meromorphic cancellation from pointwise division in the
total Gamma functions; lift parameters encode only the numerical restrictions of the four
Khare–Wintenberger lift types consumed from ClassicalSerreModularity `I.3/prescribed-lifts`.
The rational finiteness and point comparisons use its `I.2/full-kw-global-finiteness`;
the auxiliary-to-minimal Böckle comparison consumes its I.2 and R26.1 deduction with
the chosen quotient maps, reduced finite flat Hecke algebras and conductor comparison.
Family and classical-link comparisons use its `I.3/families-through-prescribed-lifts` and
`I.3/residual-links-and-modularity-transfer`. The additional strict-family and de Rham transfer
conclusions have the hypotheses specified in the README.
-/

universe u
noncomputable section
namespace TauCetiRoadmap.PotentialModularityAndCompatibleSystems

/-! ## Layer 1: Compatible-family infrastructure -/

namespace Factors

/-- The normalized reciprocal polynomial, for a monic characteristic polynomial whose
constant coefficient is nonzero. In rank zero the polynomial is `1`. -/
def dualPolynomial {M : Type u} [Field M] (Q : Polynomial M) : Polynomial M :=
  Polynomial.C ((Q.coeff 0)⁻¹) * Q.reverse

/-- `Factors.dual_charpoly` of §1.7: an invertible matrix's contragredient has the
normalized reciprocal characteristic polynomial, monic of the original rank. -/
theorem dual_charpoly {M : Type u} [Field M] {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A : Matrix ι ι M) (hA : IsUnit A) :
    (A⁻¹).transpose.charpoly = dualPolynomial A.charpoly ∧
      (dualPolynomial A.charpoly).Monic ∧
      (dualPolynomial A.charpoly).natDegree = Fintype.card ι := by
  sorry

/-- Integer real-place multiplicities `d^±` (BLGGT v4 §5.1, pp. 63–64): `n/2` for `n` even and
`(n ± (−1)^{w/2} det ℛ(c_v))/2` for `n` odd. Interpreting these as nonnegative multiplicities
requires determinant ±1 and, in odd rank, even weight. -/
def archimedeanD (n : ℕ) (w detc : ℤ) : ℤ × ℤ :=
  if Even n then ((n : ℤ) / 2, (n : ℤ) / 2)
  else (((n : ℤ) + (if Even (w / 2) then (1 : ℤ) else -1) * detc) / 2,
    ((n : ℤ) - (if Even (w / 2) then (1 : ℤ) else -1) * detc) / 2)

/-- The pointwise archimedean quotient expression of BLGGT v4 §5.1, pp. 63–64.
It agrees with the meromorphic expression where `Gammaℂ (s - w/2)` is nonzero;
elsewhere removable singularities must be cancelled before evaluation. -/
def archimedeanGammaFactor (realPlace : Bool) (H Hbar : Multiset ℤ) (w : ℤ)
    (dplus dminus : ℕ) (s : ℂ) : ℂ := by
  classical
  let central := Complex.Gammaℂ (s - (w : ℂ) / 2)
  let shifts := fun (A : Multiset ℤ) =>
    ((A.filter (fun h => 2 * h < w)).map
      (fun (h : ℤ) => Complex.Gammaℂ (s - (h : ℂ)) / central)).prod
  exact if realPlace then
    Complex.Gammaℝ (s - (w : ℂ) / 2) ^ dplus *
      Complex.Gammaℝ (s + 1 - (w : ℂ) / 2) ^ dminus * shifts H
    else central ^ H.card * shifts H * shifts Hbar

/-- The archimedean root number `ε_v = i^{d^− + Σ |h − w/2|}` (real) or
`i^{Σ_{H_τ} |h − w/2| + Σ_{H_{τ'}} |h − w/2|}` (complex). -/
def archimedeanEpsilon (realPlace : Bool) (H Hbar : Multiset ℤ) (w : ℤ) (dminus : ℕ) : ℂ := by
  classical
  let magnitude := fun (A : Multiset ℤ) =>
    (A.map (fun (h : ℤ) => |(h : ℝ) - (w : ℝ) / 2|)).sum
  exact Complex.I ^ ((if realPlace then (dminus : ℝ) + magnitude H
    else magnitude H + magnitude Hbar) : ℂ)

/-- Elliptic-curve cancellation is pointwise valid away from the denominator's poles. -/
example (s : ℂ) (hs : ∀ n : ℕ, s - 1 / 2 ≠ -(n : ℂ)) :
    archimedeanGammaFactor true {0, 1} {0, 1} 1 1 1 s = Complex.Gammaℂ s ∧
    archimedeanEpsilon true {0, 1} {0, 1} 1 1 = -1 := by
  have hne : Complex.Gammaℂ (s - 1 / 2) ≠ 0 := by
    rw [Complex.Gammaℂ_def]
    exact mul_ne_zero (mul_ne_zero two_ne_zero
      (Complex.cpow_ne_zero_iff.mpr (Or.inl (by simp [Real.pi_ne_zero]))))
      (Complex.Gamma_ne_zero hs)
  constructor
  · have hdup := Complex.Gammaℝ_mul_Gammaℝ_add_one (s - 2⁻¹)
    have hne' : Complex.Gammaℂ (s - 2⁻¹) ≠ 0 := by simpa [one_div] using hne
    simp [archimedeanGammaFactor, Multiset.filter_singleton]
    rw [show s + 1 - 2⁻¹ = s - 2⁻¹ + 1 by ring, hdup]
    rw [mul_comm]
    exact div_mul_cancel₀ _ hne'
  · simp only [archimedeanEpsilon, ite_true]
    norm_num

/-- The raw quotient is zero at `s=1/2`, while its meromorphic continuation is nonzero. -/
example : archimedeanGammaFactor true {0, 1} {0, 1} 1 1 1 (1 / 2) = 0 ∧
    Complex.Gammaℂ (1 / 2) ≠ 0 := by
  constructor
  · simp [archimedeanGammaFactor, Complex.Gammaℂ]
  · rw [Complex.Gammaℂ]
    refine mul_ne_zero (mul_ne_zero two_ne_zero ?_) (Complex.Gamma_ne_zero_of_re_pos (by norm_num))
    exact Complex.cpow_ne_zero_iff.mpr (Or.inl (by simp [Real.pi_ne_zero]))

end Factors

namespace HodgeChecks

/-- A finite Hodge multiset is regular and distinguishes sums of equal-size submultisets. -/
def IsExtremelyRegular (H : Multiset ℤ) : Prop :=
  H.Nodup ∧ ∀ A ∈ H.powerset, ∀ B ∈ H.powerset,
    A.card = B.card → A.sum = B.sum → A = B

/-- The subset sums of `{0,1,3,7}` distinguish equal-size subsets. -/
example : IsExtremelyRegular {0, 1, 3, 7} := by
  unfold IsExtremelyRegular
  decide +kernel

/-- Distinct weights alone permit the collision `0+3=1+2`. -/
example : ({0, 1, 2, 3} : Multiset ℤ).Nodup ∧
    ¬ IsExtremelyRegular {0, 1, 2, 3} := by
  unfold IsExtremelyRegular
  decide +kernel

end HodgeChecks

namespace RepRing

/-- The genuineness criterion behind the Brauer construction of Layer 12, in coordinates: a virtual
class `Σ nᵢ [Vᵢ]` in the basis of irreducibles has norm `Σ nᵢ²`; norm one and positive dimension
force it to be the class of a single irreducible (BLGGT v1 §5.4, item (9), p. 63). -/
theorem eq_single_one_of_norm_one {ι : Type*} (n : ι →₀ ℤ) (d : ι → ℤ) (hd : ∀ i, 0 < d i)
    (hnorm : (n.sum fun _ a => a ^ 2) = 1) (hdim : 0 < n.sum fun i a => a * d i) :
    ∃ i, n = Finsupp.single i 1 := by
  sorry

end RepRing

/-! ## Layer 2: Integral points and controlled fields -/

/-- A finite partition into splitting, unramified-extension and arbitrary-extension conditions.
Class `1` contains only nonarchimedean places (Qian Proposition 4.2, p.23). -/
structure LocalConditionPartition (Place : Type*) (nonarchimedean : Set Place) where
  places : Finset Place
  kind : ↥places → Fin 3
  unramified_nonarchimedean : ∀ v, kind v = 1 → v.1 ∈ nonarchimedean

/-- A place cannot carry both the splitting and unramified-extension prescriptions. -/
example {Place : Type*} {nonarchimedean : Set Place}
    (S : LocalConditionPartition Place nonarchimedean) (v : ↥S.places) :
    ¬ (S.kind v = 0 ∧ S.kind v = 1) := by
  rintro ⟨h0, h1⟩
  have h : (0 : Fin 3) = 1 := h0.symm.trans h1
  norm_num at h

/-- An archimedean place cannot carry an unramified-extension prescription. -/
example {Place : Type*} {nonarchimedean : Set Place}
    (S : LocalConditionPartition Place nonarchimedean) (v : ↥S.places)
    (hv : v.1 ∉ nonarchimedean) : S.kind v ≠ 1 :=
  fun h => hv (S.unramified_nonarchimedean v h)

namespace Fields

/-- Disjointness through towers (Qian §2, opening facts, p. 5): if `A` and `D` are linearly disjoint
over `C`, `D` is finite over `C` and `B ≤ A`, then `A ∩ BD = B`. -/
theorem inf_sup_eq_of_linearDisjoint {C Ω : Type*} [Field C] [Field Ω] [Algebra C Ω]
    (A B D : IntermediateField C Ω) [FiniteDimensional C D] (hBA : B ≤ A)
    (h : A.LinearDisjoint D) : A ⊓ (B ⊔ D) = B := by
  sorry

/-- The Galois-theoretic core of avoidance by extra split places (§2.13): if elements fixing every
point of `E` generate `Gal(D/K)`, then `E = K`. -/
theorem eq_bot_of_fixed_by_generators {K D : Type*} [Field K] [Field D] [Algebra K D]
    [FiniteDimensional K D] [IsGalois K D] (E : IntermediateField K D) (S : Set (D ≃ₐ[K] D))
    (hS : Subgroup.closure S = ⊤) (hfix : ∀ σ ∈ S, ∀ x ∈ E, σ x = x) : E = ⊥ := by
  sorry

end Fields

/-! ## Layer 3: Auxiliary characters and moduli -/

namespace Auxiliary

/-- The auxiliary prime is taken larger than `3`: the index-two subgroup of the inertia of `ℚ_p` sees
the mod-`p` cyclotomic character with order `(p − 1)/2`, which is `1` exactly for `p = 3`. -/
theorem half_order_gt_one {p : ℕ} (hp : 3 < p) (hodd : Odd p) : 1 < (p - 1) / 2 := by
  obtain ⟨k, rfl⟩ := hodd
  omega

end Auxiliary

/-! ## Layer 10: Prescribed lifts -/

namespace Presentations

/-- `R` has a presentation `𝒪⟦x₁, …, x_r⟧/(f₁, …, f_s)` as an `𝒪`-algebra. -/
def HasPresentation (O R : Type) [CommRing O] [CommRing R] [Algebra O R] (r s : ℕ) : Prop :=
  ∃ f : Fin s → MvPowerSeries (Fin r) O,
    Nonempty (R ≃ₐ[O] (MvPowerSeries (Fin r) O ⧸ Ideal.span (Set.range f)))

/-- `R` is flat over `𝒪` and a complete intersection of relative dimension `d`: a presentation
`𝒪⟦x₁, …, x_{s+d}⟧/(f₁, …, f_s)` by a regular sequence. -/
def IsFlatCompleteIntersection (O R : Type) [CommRing O] [CommRing R] [Algebra O R] (d : ℕ) :
    Prop :=
  Module.Flat O R ∧ ∃ (s : ℕ) (f : Fin s → MvPowerSeries (Fin (s + d)) O),
    RingTheory.Sequence.IsRegular (MvPowerSeries (Fin (s + d)) O) (List.ofFn f) ∧
    Nonempty (R ≃ₐ[O] (MvPowerSeries (Fin (s + d)) O ⧸ Ideal.span (Set.range f)))

/-- A nonzero finite algebra over a complete DVR with at most as many proper equations
as formal variables has equal counts and a regular sequence starting with a uniformizer
(Böckle’s appendix, Lemma 2, p. 5). The uniformizer is arbitrary, including for ramified DVRs. -/
theorem finite_presentation_complete_intersection
    {O R : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [CommRing R] [Nontrivial R] [Algebra O R] [Module.Finite O R]
    {n m : ℕ} (hmn : m ≤ n) (π : O)
    (hπ : Ideal.span ({π} : Set O) = IsLocalRing.maximalIdeal O)
    (f : Fin m → MvPowerSeries (Fin n) O)
    (hf : ∀ i, f i ∈ IsLocalRing.maximalIdeal (MvPowerSeries (Fin n) O))
    (e : R ≃ₐ[O] (MvPowerSeries (Fin n) O ⧸ Ideal.span (Set.range f))) :
    m = n ∧ Module.Flat O R ∧ RingTheory.Sequence.IsRegular (MvPowerSeries (Fin n) O)
      (algebraMap O (MvPowerSeries (Fin n) O) π :: List.ofFn f) := by
  sorry

/-- The zero-variable presentation recovers the coefficient ring. -/
example (O : Type) [CommRing O] : HasPresentation O O 0 0 := by
  refine ⟨Fin.elim0, ⟨(MvPowerSeries.isEmptyEquiv (σ := Fin 0) (R := O)).symm.trans ?_⟩⟩
  rw [Set.range_eq_empty, Ideal.span_empty]
  exact (AlgEquiv.quotientBot O _).symm

/-- A unit equation is permitted as a presentation but gives the zero algebra. -/
example (O : Type) [CommRing O] : HasPresentation O
    (MvPowerSeries (Fin 1) O ⧸ Ideal.span ({1} : Set (MvPowerSeries (Fin 1) O))) 1 1 :=
  ⟨fun _ => 1, ⟨by rw [Set.range_const]; exact AlgEquiv.refl⟩⟩

/-- `Presentations.ci_variable` of §10.2: over a nonzero noetherian coefficient ring,
the one-variable power-series algebra is flat of relative complete-intersection dimension one. -/
theorem ci_variable (O : Type) [CommRing O] [Nontrivial O] [IsNoetherianRing O] :
    IsFlatCompleteIntersection O (MvPowerSeries (Fin 1) O) 1 := by
  sorry

/-- `Presentations.ci_unit` of §10.2: a unit equation gives the zero algebra, which
cannot be a complete intersection with the required nonzero regular-sequence quotient. -/
theorem ci_unit (O : Type) [CommRing O] (d : ℕ) :
    ¬ IsFlatCompleteIntersection O
      (MvPowerSeries (Fin 1) O ⧸ Ideal.span ({1} : Set (MvPowerSeries (Fin 1) O))) d := by
  sorry

/-- `Presentations.ci_torsion` of §10.2: a nonzero scalar killing a nonzero algebra
over a domain obstructs the flatness required by a flat complete intersection. -/
theorem ci_torsion {O R : Type} [CommRing O] [IsDomain O] [CommRing R]
    [Nontrivial R] [Algebra O R] (d : ℕ) (a : O) (ha : a ≠ 0)
    (hzero : algebraMap O R a = 0) : ¬ IsFlatCompleteIntersection O R d := by
  sorry

end Presentations

namespace LiftParameters

/-- Numerical labels for the four prescriptions supplied by ClassicalSerreModularity
`I.3/prescribed-lifts` (KW I Theorem 5.1, pp. 9–10). The comparison `RequiredLiftType`
also retains the supplied full residual representation, stable lattice, determinant,
local shape and deformation conditions. -/
inductive RequiredLiftParameters (p k : ℕ) where
  | minimalCrystalline (dyadic : p = 2 → k = 2)
  | weightTwo
  | levelOne (q i : ℕ) (prime : q.Prime) (odd : q ≠ 2) (divides : p ∣ q - 1)
      (range : 0 < i ∧ i ≤ q - 2) (dyadic : p = 2 → Even i)
  | levelTwo (q i j : ℕ) (prime : q.Prime) (ne : q ≠ p) (divides : p ∣ q + 1)
      (range : j < i ∧ i ≤ q - 1)
      (order : ∃ r : ℕ, (q ^ 2 - 1) / Nat.gcd (q ^ 2 - 1) (i + q * j) = p ^ r)
      (dyadic : p = 2 → Even (i + j))

namespace RequiredLiftParameters
variable {p k : ℕ}

/-- The auxiliary prime is present only for the last two prescriptions. -/
def auxiliaryPrime : RequiredLiftParameters p k → Option ℕ
  | levelOne q .. => some q
  | levelTwo q .. => some q
  | _ => none

/-- The noncrystalline prescriptions require monodromy at odd `k=p+1` and dyadic `k=4`. -/
def requiresSteinberg : RequiredLiftParameters p k → Prop
  | minimalCrystalline _ => False
  | _ => (p = 2 ∧ k = 4) ∨ (p ≠ 2 ∧ k = p + 1)

end RequiredLiftParameters
end LiftParameters

/-! ## Layer 13: Residual members and linked systems -/

namespace ResidualMembers

/-- The weight argument of §13.1: outside the small primes, the normalized weight `a − b + 1` of a
regular member is neither of the two weights `(l + 1)/2`, `(l + 3)/2` forced by a reducible
restriction to `ℚ(ζ_l)` (KW I, proof of Theorem 10.1, p. 20). -/
theorem weight_ne_half_weights {l a b : ℕ} (hodd : Odd l) (hab : b < a) (hl : 2 * (a - b) + 1 < l) :
    a - b + 1 ≠ (l + 1) / 2 ∧ a - b + 1 ≠ (l + 3) / 2 := by
  sorry

end ResidualMembers

/-! The following named targets are stated in README.md. Their arithmetic, geometric or
automorphic carriers require the supplier theories described there.
Layer 1: `conjugationExtendsIntegralModel`, `weakCompatibility_ofKW`, `CompatibleSystem`, `induce`, `PolarizedSystem`, `WeaklyCompatibleSystem.IsRegular`, `symmetricPower`, `rankZeroSystem`, `PolarizedSystem.tensor`, `characterSystem`, `rank_one_purity`, `induced_character_purity`, `artinSystem`, `artin_twist_purity`, `rank_two_reducibility_independent_of_lambda`, `partialLFunction`, `RepRing`, `RepRing.brauer_transport`, `RepRing.eq_irreducible_of_pairing_eq_one`, `monodromy_component_field`, `hodgeTateCocharacterInMonodromy`, `LarsenData.G`, `serre_theta_uniform_bounds`, `larsen_good_primes`, `residual_irreducibility_density_one`, `constituents_essentially_self_dual`.
Layer 2: `SkolemDatum`, `density_of_algebraic_local_points`, `elementary_reductions`, `reduction_to_curves`, `Picard.generalizedPicard`, `local_picard_opens_and_approximation`, `compact_generalized_jacobian_quotient`, `moret_bailly_integral_point`, `splitField_density_of_integralPoints`, `splitField_points_dense`, `function_field_chebotarev`, `frobenius_primes_generate`, `disjointness_by_extra_split_places`, `Fields.inf_sup_eq_of_linearDisjoint`, `cht_character_extension`, `cht_soluble_prescribed_completions`, `moret_bailly_three_local_conditions`, `moret_bailly_above_preliminary_field`, `snowden_soluble_preliminary_field`, `surjectiveSpecialisation`, `schemeChebotarevPoints`, `function_field_isom_torsor`, `fixed_constant_field`, `potential_global_galois_local_data`.
Layer 3: `exists_cm_character_with_local_reductions`, `TaylorAuxiliaryData`, `local_points_twisted_hilbert_moduli`, `restricted_auxiliary_moduli`, `jointPairedTorsionModuli`, `hilbertGoodReductionOpen`, `snowdenTwoPrimeRealization`.
Layer 4: `dyadicAuxiliaryModuli`, `auxiliary_tateModule_ordinary_shape`, `quaternionic_hecke_galois_realisation`, `local_residual_inertial_shape`, `skinner_wiles_level_adjustment`, `taylor_crystalline_lifting`, `taylorMinimalREqualsT`, `taylorNonminimalREqualsT`, `auxiliary_modularity_transfer`, `taylor_ordinary_potential_residual`, `taylor_niveau_two_potential_residual`, `weight_reduction_hecke_surjection`, `weightShift`, `weight_and_level_potential_residual`, `taylor_serre_weight_potential_residual`, `kw_potential_residual`, `kw_ordinary_potential_residual`, `snowdenCMSeed`, `snowdenWeightTwoLifting`, `snowdenWeightTwoRingFiniteness`, `snowdenPrescribedWeightTwoLift`, `snowdenResidualSolubleDescent`, `snowden_potential_residual`, `bcgp_potential_residual`.
Layer 5: `potential_modularity_given_lift`.
Layer 6: `controlled_extension`, `bcgp_local_data`.
Layer 8: `AuxiliaryField`, `kwMinimalRingFiniteOverAuxiliaryField`, `kwGlobalFiniteness`, `DefiniteUnitaryTwo.ordinaryHeckeAlgebra`, `DefiniteUnitaryTwo.heckeGaloisRepresentation`, `rank_two_ordinary_patching`, `rank_two_ordinary_automorphy_and_finiteness`, `ordinary_global_finiteness`, `cgRingFiniteness`.
Layer 9: `exists_lift_of_required_type`, `newton_thorne_point`.
Layer 10: `bockle_presentation`, `Presentations.finite_presentation_complete_intersection`, `bockle_minimal_r_equals_t`, `exists_minimally_ramified_lift`, `RequiredLiftType`, `exists_minimal_crystalline_lift`, `exists_minimal_weight_two_lift`, `exists_lift_level_one_type_at_q`, `exists_lift_level_two_type_at_q`, `requiredLiftType_applications`, `modern_prescribed_type_lifts`.
Layer 11: `alpha_beta_from_residual_modularity`, `rational_field_modularity_lifting`.
Layer 12: `brauerSystem`, `brauerOverlapHomCharacters`, `almost_strict_compatibility`, `strict_brauer_system`, `exists_family_through_required_lift`, `dieulefait_families`.
Layer 13: `residual_members`, `local_compatibility_at_the_coefficient_prime`, `linked_systems_modularity_transfer`.
`bockle_minimal_r_equals_t` compares the canonical minimal map with the deduction owned by
ClassicalSerreModularity I.2 and R26.1. It retains the auxiliary integral isomorphism as a
hypothesis, the actual quotient square, reduced finite flat Hecke algebras and Carayol's
conductor comparison.
`DefiniteUnitaryTwo.heckeGaloisRepresentation` factors locally through the ordinary image ring:
for domain coefficients A its stable full flag is over an algebraic closure of Frac(A).
At algebraically closed characteristic-zero specializations the ordered graded characters
restrict on inertia to the specialized universal inertial characters of Λ_ṽ.
The rational comparisons `kwMinimalRingFiniteOverAuxiliaryField`, `kwGlobalFiniteness` and
`exists_lift_of_required_type` consume ClassicalSerreModularity `I.2/full-kw-global-finiteness`,
including its integral point extraction. `RequiredLiftType` and the four named lift-existence
targets compare its `I.3/prescribed-lifts` with the local interfaces here.
`exists_family_through_required_lift` consumes `I.3/families-through-prescribed-lifts`, preserves
the selected member and applies the all-place strictness upgrade of §12.3.
`linked_systems_modularity_transfer` compares the classical branch with
`I.3/residual-links-and-modularity-transfer`; its additional de Rham branches carry the
hypotheses of GL2ModularityLifting, including LC for the Pan alternative.
Taylor/HBAV branches carry the ordered polarization norm witnesses of §§3.2–3.3;
dyadic local constructions consume `dyadicAuxiliaryModuli` with its polarization hypotheses.
The dyadic determinant normalization in §12.5 uses `ρ̄₀=ρ̄⊗η⁻¹` with `η²=det ρ̄` and η
unramified at 2; twisting the modular witness back by the Teichmüller lift of η recovers ρ̄.
The niveau-two construction uses joint prime levels and polarization descent from §3.5;
`auxiliary_modularity_transfer` permits ramified coefficient primes and proves its crystalline
rank-two Hodge assertion via rational coefficient summands. Its lifting step uses the nonminimal
comparison of §4.5. Snowden's residual construction uses §3.6 and `snowdenCMSeed` before finiteness.
The family predicates and operations use the shared `AutomorphicSystemData` and its supplied
`Weak`, `Strict`, `VeryWeak` and `ExtremelyWeak` predicates. The additional KW, polarized,
regularity, purity, away-coefficient strictness and automorphy conditions are specified in §§1.2–1.8.
The full `cgRingFiniteness` and `dieulefait_families` retain the hypotheses in §§8.8 and 12.5;
their adequate-image and KW-type milestones do not discharge the remaining cases. -/

end TauCetiRoadmap.PotentialModularityAndCompatibleSystems
