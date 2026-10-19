import Mathlib
import TauCeti.RingTheory.WittVector.Frobenius

/-!
# CohomologyComparisons: representative target signatures

The roadmap is `README.md` in this directory; this file is not exhaustive. The statements here
are suggested forms for the definitions and theorem signatures of the roadmap. The file
records the definitions that can be given real bodies against the pinned Mathlib and Tau Ceti, and
the statements whose carriers exist at the pins, proved by `sorry` unless a short proof exists.

The comparison theorems of the roadmap concern A_inf, crystalline, prismatic, infinitesimal,
Hyodo–Kato and pro-étale cohomology of formal schemes and rigid spaces, none of which exists at the
pins. AInfCohomology §AI.6.5 supplies canonical `B_dR⁺` cohomology and its envelope maps.
PrismaticCohomologyPartIII §7.0 supplies the graded Beilinson square.
PadicHodgeTheory §§8.1–8.2 supplies the finite-base rational maps and prismatic specialization
agreement; the broader and derived comparisons retain these maps under
`finiteBaseComparisonAgreement`.
PrismaticCohomologyPartIV §§8.1–8.29, 8.35, 8.41–8.42, 8.56 and 8.69 supplies the generic
logarithmic prismatic constructions and comparisons, with each comparison's hypotheses;
§8.60 supplies the shared log adic structures, logification, pullback, integral fs charts and
Kummer-étale site. Layer 4.6 constructs the additional period and Hyodo–Kato agreement diagrams.
The remaining heavy objects (the relative infinitesimal site, analytic-to-perfect coefficient
extension, pro-Kummer tower and logarithmic period sheaf on modular curves, and
affinoid-perfectoid flag basis) are
README targets with their intended signatures; the closing
comment lists them.

Design choices made explicit here:
- `A_inf = W(O^♭)` is `WittVector p (PreTilt O p)`; Fontaine's `θ` is Mathlib's
  `WittVector.fontaineTheta`; `B_dR⁺` and `B_dR` are Mathlib's `BDeRhamPlus` and `BDeRham`.
- The ring `O = O_C` is described in Mathlib's vocabulary: a `p`-adically complete valuation
  domain of Krull dimension one and characteristic zero whose fraction field is algebraically
  closed, with `p` not a unit.
- `ε = (1, ζ_p, ζ_{p²}, …) ∈ O^♭` with `ζ_p ≠ 1`; `μ = [ε] - 1`; `ξ` is the geometric sum
  `∑_{i<p} [ε^{1/p}]^i`, never a quotient; `θ̃ = θ ∘ φ⁻¹` and `ξ̃ = φ(ξ)`. The Witt reduction
  `w : A_inf → W(k)` sends `ξ` to `p`, whereas `θ` sends it to `0`.
- The specialization dictionary separates its data from its normalization equations
  (`SpecializationDictionary.IsNormalized`); `A_cris` enters as a parameter, being constructed in
  `PadicPeriodRings`, §3.
- The algebraic interface to AInfCohomology §AI.6.5’s presented envelope completes along the
  whole presentation kernel (`AdicCompletion (RingHom.ker e) P`).
- Monodromy transport under a change of uniformizer is `exp(-c N)` (`IsNilpotent.exp`), for the
  negative evaluation convention and period monodromy `N_Bst = -d/dT`: raw arithmetic
  `N_raw` and normalized `N_norm = N_raw / e` use `c = log_K u` and `c = e log_K u` respectively.
- Truncated torsion length is the `ℕ∞`-valued `Module.length` of `M_tor / π^n M_tor`.
- Projective bundles use quotient lines: `hⁿ - c₁ hⁿ⁻¹ + ⋯ + (-1)ⁿ cₙ = 0`.
-/

namespace TauCetiRoadmap.CohomologyComparisons

open WittVector Polynomial

universe u

#check WittVector.fontaineTheta
#check BDeRhamPlus
#check BDeRham
#check AdicCompletion.isAdicComplete
#check WittVector.frobeniusEquiv_symm_teichmuller
#check AdicCompletion.evalₐ_of
#check AdicCompletion.ext_evalₐ
#check IsNilpotent.exp

/-! ## Layer 0: Coefficient maps and normalization -/

section Coefficients

variable (O : Type u) [CommRing O] (p : ℕ) [Fact p.Prime] [Fact ¬IsUnit (p : O)]

/-- `A_inf = W(O^♭)`. -/
abbrev Ainf : Type u := WittVector p (PreTilt O p)

variable [IsAdicComplete (Ideal.span {(p : O)}) O]

/-- The Witt vector Frobenius `φ` of `A_inf`, an automorphism because `O^♭` is perfect. -/
noncomputable def ainfFrobenius : Ainf O p ≃+* Ainf O p :=
  WittVector.frobeniusEquiv p (PreTilt O p)

/-- The Frobenius-twisted specialization `θ̃ = θ ∘ φ⁻¹ : A_inf → O`. -/
noncomputable def fontaineThetaTilde : Ainf O p →+* O :=
  (WittVector.fontaineTheta O p).comp (ainfFrobenius O p).symm.toRingHom

/-- `ε^{1/p}`, the inverse Frobenius of `ε` in the perfect ring `O^♭`. -/
noncomputable def epsRoot (ε : PreTilt O p) : PreTilt O p :=
  (_root_.frobeniusEquiv (PreTilt O p) p).symm ε

/-- `ε = (1, ζ_p, ζ_{p²}, …)` is a compatible system of `p`-power roots of unity with `ζ_p ≠ 1`:
the untilt of `ε` is `1` and the untilt of `ε^{1/p}` is not. -/
def IsPrimitiveRootSystem (ε : PreTilt O p) : Prop :=
  PreTilt.untilt ε = 1 ∧ PreTilt.untilt (epsRoot O p ε) ≠ 1

/-- `μ = [ε] - 1`. -/
noncomputable def muOf (ε : PreTilt O p) : Ainf O p := teichmuller p ε - 1

/-- `ξ = ∑_{i<p} [ε^{1/p}]^i`, the element written `μ / φ⁻¹(μ)`. -/
noncomputable def xiOf (ε : PreTilt O p) : Ainf O p :=
  ∑ i ∈ Finset.range p, teichmuller p (epsRoot O p ε) ^ i

/-- `ξ̃ = φ(ξ)`. -/
noncomputable def xiTildeOf (ε : PreTilt O p) : Ainf O p := ainfFrobenius O p (xiOf O p ε)

/-- The canonical map `A_inf → A_inf[1/p] → B_dR⁺` into Mathlib's completion. -/
noncomputable def ainfToBdRPlus : Ainf O p →+* BDeRhamPlus O p :=
  (algebraMap (Localization.Away (p : Ainf O p))
    (AdicCompletion (RingHom.ker (fontaineThetaInvertP O p))
      (Localization.Away (p : Ainf O p)))).comp
    (algebraMap (Ainf O p) (Localization.Away (p : Ainf O p)))

/-- Localization at `p` makes its canonical image in the actual completion a unit. -/
example : IsUnit (ainfToBdRPlus O p (p : Ainf O p)) := by
  change IsUnit ((algebraMap (Localization.Away (p : Ainf O p))
    (AdicCompletion (RingHom.ker (fontaineThetaInvertP O p))
      (Localization.Away (p : Ainf O p))))
    (algebraMap (Ainf O p) (Localization.Away (p : Ainf O p)) (p : Ainf O p)))
  exact (IsLocalization.Away.algebraMap_isUnit (p : Ainf O p)).map _

omit [IsAdicComplete (Ideal.span {(p : O)}) O] in
/-- The geometric-sum normalization of `ξ`: `μ = ξ · φ⁻¹(μ)`, for every `ε`. This is the
identity `[ε] - 1 = (∑_{i<p} [ε^{1/p}]^i)([ε^{1/p}] - 1)` (BMS1, Example 3.16, p.25). -/
theorem muOf_eq_xiOf_mul (ε : PreTilt O p) :
    muOf O p ε = xiOf O p ε * (ainfFrobenius O p).symm (muOf O p ε) := by
  have hroot : (epsRoot O p ε) ^ p = ε :=
    (_root_.frobeniusEquiv (PreTilt O p) p).apply_symm_apply ε
  have hinv : (ainfFrobenius O p).symm (teichmuller p ε) =
      teichmuller p (epsRoot O p ε) :=
    WittVector.frobeniusEquiv_symm_teichmuller ε
  simp only [muOf, map_sub, map_one, hinv]
  rw [xiOf, geom_sum_mul, ← map_pow, hroot]

/-- The trivial root system is a negative control: `μ = 0` at `ε = 1`, so no localization at
`μ` maps to a nonzero period field. -/
example : muOf O p 1 = 0 := by
  simp [muOf]

/-- `θ(ξ) = 1 + ζ_p + ⋯ + ζ_p^{p-1} = 0` (BMS1, Example 3.16, p.25). -/
theorem fontaineTheta_xiOf [IsDomain O] {ε : PreTilt O p} (hε : IsPrimitiveRootSystem O p ε) :
    WittVector.fontaineTheta O p (xiOf O p ε) = 0 := by
  sorry

/-- Raising a primitive system to `p` constructs a delayed system whose first root is the
original system, whose first-root test fails, and whose second root has nontrivial untilt. -/
example {ε : PreTilt O p} (hε : IsPrimitiveRootSystem O p ε) :
    let ε' := ε ^ p
    epsRoot O p ε' = ε ∧ ¬ IsPrimitiveRootSystem O p ε' ∧
      PreTilt.untilt (epsRoot O p (epsRoot O p ε')) ≠ 1 := by
  have hroot : epsRoot O p (ε ^ p) = ε := by
    exact (_root_.frobeniusEquiv (PreTilt O p) p).symm_apply_apply ε
  dsimp only
  rw [hroot]
  exact ⟨rfl, fun h => h.2 (hroot.symm ▸ hε.1), hε.2⟩

/-- A primitive system gives a nontrivial first root and zero `θ`-image of `μ`. -/
example {ε : PreTilt O p} (hε : IsPrimitiveRootSystem O p ε) :
    PreTilt.untilt (epsRoot O p ε) ≠ 1 ∧
      WittVector.fontaineTheta O p (muOf O p ε) = 0 := by
  refine ⟨hε.2, ?_⟩
  simp [muOf, WittVector.fontaineTheta_teichmuller, hε.1]

section Residue

variable [IsLocalRing O]

/-- `O^♭ → k`: the zeroth coordinate in `O/p`, followed by `O/p → k`. -/
noncomputable def residueOfTilt : PreTilt O p →+* IsLocalRing.ResidueField O :=
  (Ideal.Quotient.factor ((Ideal.span_singleton_le_iff_mem _).2
    ((IsLocalRing.mem_maximalIdeal _).2 (mem_nonunits_iff.2 Fact.out)))).comp
    (PreTilt.coeff 0 : PreTilt O p →+* ModP O p)

/-- The Witt reduction `w : A_inf → W(k)`, induced by `O^♭ → k`. -/
noncomputable def wittReduction : Ainf O p →+* WittVector p (IsLocalRing.ResidueField O) :=
  WittVector.map (residueOfTilt O p)

/-- The Witt reduction sends `ξ` to `p`: each `[ε^{1/p}]` reduces to `1` (BMS1, Example 3.16,
p.25, and §4.3, p.40). -/
theorem wittReduction_xiOf {ε : PreTilt O p} (hε : IsPrimitiveRootSystem O p ε) :
    wittReduction O p (xiOf O p ε) = p := by
  sorry

/-- The Witt reduction kills `μ`. -/
theorem wittReduction_muOf {ε : PreTilt O p} (hε : IsPrimitiveRootSystem O p ε) :
    wittReduction O p (muOf O p ε) = 0 := by
  have h : residueOfTilt O p ε = 1 := by
    have h0 : (PreTilt.coeff 0 : PreTilt O p →+* ModP O p) ε = 1 := by
      rw [← PreTilt.mk_untilt_eq_coeff_zero, hε.1, map_one]
    unfold residueOfTilt
    erw [RingHom.comp_apply, h0]
    exact map_one _
  simp [wittReduction, muOf, WittVector.map_teichmuller, h]

/-- The Witt reduction intertwines the Frobenius of `A_inf` with the Witt vector Frobenius of
`W(k)`. -/
theorem wittReduction_comp_ainfFrobenius :
    (wittReduction O p).comp (ainfFrobenius O p).toRingHom =
      WittVector.frobenius.comp (wittReduction O p) := by
  sorry

end Residue

section IntegersOfC

variable [IsDomain O] [ValuationRing O] [Ring.KrullDimLE 1 O] [CharZero O]
  [IsAlgClosed (FractionRing O)]

/-- The ring of integers of an algebraically closed complete mixed-characteristic field
admits a primitive compatible system of `p`-power roots of unity (README §0.1). -/
theorem exists_primitiveRootSystem : ∃ ε : PreTilt O p, IsPrimitiveRootSystem O p ε := by
  sorry

/-- For `O = O_C`, `ker θ = (ξ)` (BMS1, Example 3.16, p.25). -/
theorem ker_fontaineTheta {ε : PreTilt O p} (hε : IsPrimitiveRootSystem O p ε) :
    RingHom.ker (WittVector.fontaineTheta O p) = Ideal.span {xiOf O p ε} := by
  sorry

/-- For `O = O_C`, `ker θ̃ = (ξ̃)` (BMS1, Example 3.16, p.25, and Lemma 3.12 at `r = 1`, p.23). -/
theorem ker_fontaineThetaTilde {ε : PreTilt O p} (hε : IsPrimitiveRootSystem O p ε) :
    RingHom.ker (fontaineThetaTilde O p) = Ideal.span {xiTildeOf O p ε} := by
  sorry

/-- In the `O_C` range the canonical image of `ξ` is nonzero and irreducible, hence a
uniformizer in the complete DVR supplied by PadicPeriodRings §4.1 (README §0.1). -/
theorem ainfToBdRPlus_xiOf_irreducible {ε : PreTilt O p} (hε : IsPrimitiveRootSystem O p ε) :
    ainfToBdRPlus O p (xiOf O p ε) ≠ 0 ∧
      Irreducible (ainfToBdRPlus O p (xiOf O p ε)) := by
  sorry

end IntegersOfC

end Coefficients

/-- The coefficient maps of the comparisons: `φ`, `θ`, `θ̃`, the Witt reduction `w` with the
Witt vector Frobenius of `W = W(k)`, the maps `A → A_cris → B_dR⁺` and `A → B_dR⁺`, and the
elements `ξ`, `μ`. The normalization equations are `SpecializationDictionary.IsNormalized`;
the value for `O = O_C` is `SpecializationDictionary.standard`. -/
structure SpecializationDictionary (A O W Acrys BdRPlus : Type*) [CommRing A] [CommRing O]
    [CommRing W] [CommRing Acrys] [CommRing BdRPlus] where
  /-- The Frobenius automorphism of `A`. -/
  phi : A ≃+* A
  /-- Fontaine's `θ`. -/
  theta : A →+* O
  /-- The twisted specialization `θ̃`. -/
  thetaTilde : A →+* O
  /-- The Witt reduction `w`. -/
  witt : A →+* W
  /-- The Witt vector Frobenius `F` of `W`. -/
  phiW : W →+* W
  /-- `A → A_cris`. -/
  toAcrys : A →+* Acrys
  /-- `A_cris → B_dR⁺`. -/
  acrysToBdRPlus : Acrys →+* BdRPlus
  /-- `A → B_dR⁺`. -/
  toBdRPlus : A →+* BdRPlus
  /-- The generator `ξ` of `ker θ`. -/
  xi : A
  /-- `μ = [ε] - 1`. -/
  mu : A

namespace SpecializationDictionary

variable {A O W Acrys BdRPlus : Type*} [CommRing A] [CommRing O] [CommRing W] [CommRing Acrys]
  [CommRing BdRPlus] (d : SpecializationDictionary A O W Acrys BdRPlus)

/-- `ξ̃ = φ(ξ)`. -/
def xiTilde : A := d.phi d.xi

/-- The normalization equations of a specialization dictionary (BMS1, Example 3.16, p.25,
Definition 3.22, p.27, and §4.3, p.40). -/
structure IsNormalized (p : ℕ) : Prop where
  thetaTilde_eq : d.thetaTilde = d.theta.comp d.phi.symm.toRingHom
  period_eq : d.toBdRPlus = d.acrysToBdRPlus.comp d.toAcrys
  theta_xi_eq : d.theta d.xi = 0
  ker_theta_eq : RingHom.ker d.theta = Ideal.span {d.xi}
  ker_thetaTilde_eq : RingHom.ker d.thetaTilde = Ideal.span {d.xiTilde}
  witt_xi_eq : d.witt d.xi = p
  witt_mu_eq : d.witt d.mu = 0
  witt_phi_eq : d.witt.comp d.phi.toRingHom = d.phiW.comp d.witt
  mu_eq : d.mu = d.xi * d.phi.symm d.mu

variable {d} {p : ℕ}

/-- A normalized dictionary evaluates `θ̃` by inverse Frobenius followed by `θ` (README §0.1). -/
theorem thetaTilde_apply (h : d.IsNormalized p) (a : A) :
    d.thetaTilde a = d.theta (d.phi.symm a) := by
  sorry

/-- A normalized dictionary sends its kernel generator to zero under `θ` (README §0.1). -/
theorem theta_xi (h : d.IsNormalized p) : d.theta d.xi = 0 := by
  sorry

/-- Witt reduction sends a normalized dictionary's kernel generator to `p` (README §0.1). -/
theorem witt_xi (h : d.IsNormalized p) : d.witt d.xi = p := by
  sorry

/-- Witt reduction kills the cyclotomic element of a normalized dictionary (README §0.1). -/
theorem witt_mu (h : d.IsNormalized p) : d.witt d.mu = 0 := by
  sorry

/-- The two specialization kernels are generated by `ξ` and `φ(ξ)` (README §0.1). -/
theorem ker_theta (h : d.IsNormalized p) :
    RingHom.ker d.theta = Ideal.span {d.xi} ∧
      RingHom.ker d.thetaTilde = Ideal.span {d.xiTilde} := by
  sorry

/-- Witt reduction intertwines both Frobenius maps of a normalized dictionary (README §0.1). -/
theorem witt_frobenius (h : d.IsNormalized p) :
    d.witt.comp d.phi.toRingHom = d.phiW.comp d.witt := by
  sorry

/-- When `p ≠ 0` in `W`, the Witt reduction does not kill `ξ`; a dictionary that used `θ` in
place of `w` fails this. -/
example (h : d.IsNormalized p) (hp : (p : W) ≠ 0) :
    d.theta d.xi = 0 ∧ d.witt d.xi ≠ 0 := by
  refine ⟨h.theta_xi_eq, ?_⟩
  rw [h.witt_xi_eq]
  exact hp

/-- The two arrows to `B_dR⁺` agree on every element. -/
theorem period_composite (h : d.IsNormalized p) (a : A) :
    d.toBdRPlus a = d.acrysToBdRPlus (d.toAcrys a) :=
  h.period_eq ▸ rfl

/-- A normalized dictionary kills `ξ̃` under `θ̃`. -/
theorem thetaTilde_xiTilde (h : d.IsNormalized p) : d.thetaTilde d.xiTilde = 0 := by
  rw [h.thetaTilde_eq]
  simpa [xiTilde] using h.theta_xi_eq

end SpecializationDictionary

section Standard

variable (O : Type u) [CommRing O] (p : ℕ) [Fact p.Prime] [Fact ¬IsUnit (p : O)]
  [IsAdicComplete (Ideal.span {(p : O)}) O]

/-- The dictionary of `O` for the root system `ε`: `A = W(O^♭)` with its Witt vector Frobenius,
Mathlib's `θ`, `θ̃ = θ ∘ φ⁻¹`, the Witt reduction to `W(k)` with its Witt vector Frobenius,
Mathlib's `B_dR⁺` with its canonical map, `ξ` and `μ`. The ring `A_cris` and the maps
`A_inf → A_cris → B_dR⁺` are those of `PadicPeriodRings`, §3. -/
noncomputable def SpecializationDictionary.standard [IsLocalRing O] (Acris : Type u)
    [CommRing Acris] (toAcris : Ainf O p →+* Acris) (acrisToBdRPlus : Acris →+* BDeRhamPlus O p)
    (ε : PreTilt O p) :
    SpecializationDictionary (Ainf O p) O (WittVector p (IsLocalRing.ResidueField O)) Acris
      (BDeRhamPlus O p) where
  phi := ainfFrobenius O p
  theta := WittVector.fontaineTheta O p
  thetaTilde := fontaineThetaTilde O p
  witt := wittReduction O p
  phiW := WittVector.frobenius
  toAcrys := toAcris
  acrysToBdRPlus := acrisToBdRPlus
  toBdRPlus := ainfToBdRPlus O p
  xi := xiOf O p ε
  mu := muOf O p ε

/-- For `O = O_C`, a primitive root system and `A_cris → B_dR⁺` restricting to the canonical map
on `A_inf`, the standard dictionary is normalized (BMS1, Example 3.16, p.25, Definition 3.22,
p.27, §4.3, p.40). -/
theorem SpecializationDictionary.standard_isNormalized [IsDomain O] [ValuationRing O]
    [Ring.KrullDimLE 1 O] [CharZero O] [IsAlgClosed (FractionRing O)]
    (Acris : Type u) [CommRing Acris] (toAcris : Ainf O p →+* Acris)
    (acrisToBdRPlus : Acris →+* BDeRhamPlus O p)
    (hcris : acrisToBdRPlus.comp toAcris = ainfToBdRPlus O p)
    {ε : PreTilt O p} (hε : IsPrimitiveRootSystem O p ε) :
    (SpecializationDictionary.standard O p Acris toAcris acrisToBdRPlus ε).IsNormalized p := by
  sorry

end Standard

/-! ## Layer 2: Supplied algebraic envelope interface -/

/-- The algebraic interface to AInfCohomology §AI.6.5’s presented infinitesimal envelope `D(e) = lim_m P/(ker e)^m` of a surjection `e : P → R`:
completion along the whole presentation kernel (BMS1, Construction 13.6, p.106). The analytic
presentation `P_Σ = lim_n (B_dR⁺/ξ^n)⟨X_u^{±1}⟩` and its topology come from `AdicSpacesPartII`. -/
abbrev InfinitesimalEnvelope {P R : Type*} [CommRing P] [CommRing R] (e : P →+* R) : Type _ :=
  AdicCompletion (RingHom.ker e) P

namespace InfinitesimalEnvelope

variable {P R : Type*} [CommRing P] [CommRing R] (e : P →+* R)

/-- The supplied envelope’s functoriality: a ring map `g : P → P'` over `R` induces `D(e) → D(e')` compatible with the
canonical maps and the projections (BMS1, Lemma 13.13, p.111, for the refinement maps). -/
theorem exists_map {P' : Type*} [CommRing P'] (e' : P' →+* R) (g : P →+* P')
    (hg : e'.comp g = e) :
    ∃ φ : InfinitesimalEnvelope e →+* InfinitesimalEnvelope e',
      φ.comp (algebraMap P (InfinitesimalEnvelope e)) =
        (algebraMap P' (InfinitesimalEnvelope e')).comp g := by
  sorry

/-- The supplied envelope’s universal property: for finitely generated `ker e`, a `P`-algebra `S` complete for an
ideal `J` containing the image of `ker e` receives a unique ring map from `D(e)` extending the
structure map. -/
theorem existsUnique_lift (hfg : (RingHom.ker e).FG) {S : Type*} [CommRing S] [Algebra P S]
    (J : Ideal S) [IsAdicComplete J S] (hJ : (RingHom.ker e).map (algebraMap P S) ≤ J) :
    ∃! φ : InfinitesimalEnvelope e →+* S,
      φ.comp (algebraMap P (InfinitesimalEnvelope e)) = algebraMap P S := by
  sorry

/-- The envelope of the identity is the ring itself, including the zero ring. -/
example (B : Type*) [CommRing B] :
    Function.Bijective (algebraMap B (InfinitesimalEnvelope (RingHom.id B))) := by
  change Function.Bijective (AdicCompletion.of (RingHom.ker (RingHom.id B)) B)
  have hker : RingHom.ker (RingHom.id B) = ⊥ :=
    (RingHom.injective_iff_ker_eq_bot (RingHom.id B)).mp Function.injective_id
  rw [hker]
  exact AdicCompletion.of_bijective (⊥ : Ideal B) B

/-- For `ℚ[X] → ℚ`, `X ↦ 0`, the completed coordinate is nonzero modulo `(X)²` although its first
projection vanishes: the envelope is not the first quotient (README §2.2). -/
theorem coordinate_survives_second_projection :
    AdicCompletion.evalₐ (RingHom.ker (Polynomial.evalRingHom (0 : ℚ))) 1
        (algebraMap ℚ[X] (InfinitesimalEnvelope (Polynomial.evalRingHom (0 : ℚ))) X) = 0 ∧
      AdicCompletion.evalₐ (RingHom.ker (Polynomial.evalRingHom (0 : ℚ))) 2
        (algebraMap ℚ[X] (InfinitesimalEnvelope (Polynomial.evalRingHom (0 : ℚ))) X) ≠ 0 := by
  sorry

end InfinitesimalEnvelope

/-! ## Layer 4: Semistable and logarithmic comparison -/

section Monodromy

variable {K A : Type*} [Field K] [Ring A] [Algebra K A] [Module ℚ A]

/-- The transport `exp(-c N)` of horizontal sections under the change of coordinate
`T' = T + c`, for a nilpotent monodromy `N`. For uniformizers `π` and `πu`, the negative
evaluation convention uses `c = log_K u` with raw arithmetic monodromy, or `c = e log_K u`
with `N_norm = N_raw / e`, where `e = v_π(p)` (Česnavičius–Koshikawa, §9.1, p.75;
AInfCohomology §AI.6.4, `Semistable.pNormalizedMonodromy`). The supplied cohomological operator
is nilpotent; this definition provides its finite-exponential transport. -/
noncomputable def monodromyTransport (c : K) (N : A) : A :=
  IsNilpotent.exp (-(c • N))

/-- Zero coordinate change gives identity monodromy transport (README §4.5). -/
theorem monodromyTransport_zero_left (N : A) : monodromyTransport (0 : K) N = 1 := by
  simp [monodromyTransport, IsNilpotent.exp_zero]

/-- Vanishing monodromy makes every coordinate transport the identity (README §4.5). -/
theorem monodromyTransport_zero_right (c : K) : monodromyTransport c (0 : A) = 1 := by
  simp [monodromyTransport, IsNilpotent.exp_zero]

/-- The unit cocycle: transports along `c` and `d` compose to the transport along `c + d`. -/
theorem monodromyTransport_add {N : A} (hN : IsNilpotent N) (c d : K) :
    monodromyTransport (c + d) N = monodromyTransport c N * monodromyTransport d N := by
  rw [monodromyTransport, monodromyTransport, monodromyTransport, add_smul, neg_add,
    IsNilpotent.exp_add_of_commute]
  · exact ((Commute.refl N).smul_left c).smul_right d |>.neg_left.neg_right
  · exact (hN.smul c).neg
  · exact (hN.smul d).neg

/-- Rescaling monodromy by `e⁻¹` and the coordinate change by `e ≠ 0` preserves transport
(README §4.5). This identifies the raw and p-normalized uniformizer-change formulas. -/
theorem monodromyTransport_rescale (e c : K) (he : e ≠ 0) (N : A) :
    monodromyTransport (e * c) (e⁻¹ • N) = monodromyTransport c N := by
  sorry

/-- The two-term witness: for `N e₁ = e₀`, `N e₀ = 0`, the transport sends `e₁` to `e₁ - c e₀`,
fixing the sign and the direction of the coordinate change. -/
example (c : ℚ) :
    (monodromyTransport c !![(0 : ℚ), 1; 0, 0]).mulVec ![0, 1] = ![-c, 1] := by
  have hN : (-(c • !![(0 : ℚ), 1; 0, 0])) ^ 2 = 0 := by
    ext i j; fin_cases i <;> fin_cases j <;> simp [sq, Matrix.mul_apply, Fin.sum_univ_two]
  rw [monodromyTransport, IsNilpotent.exp_eq_sum hN]
  ext i; fin_cases i <;> simp [Finset.sum_range_succ, Matrix.mulVec, dotProduct, Fin.sum_univ_two]

end Monodromy

/-! ## Layer 5: Integral torsion inequalities and lattice recovery -/

/-- `length_R (M_tor / π^n M_tor)`, the truncated torsion length compared across the integral
specializations (BMS1, Theorem 14.5(ii), pp.120–121). -/
noncomputable def truncatedTorsionLength (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]
    (π : R) (n : ℕ) : ℕ∞ :=
  Module.length R (Submodule.torsion R M ⧸
    (Ideal.span {π ^ n} • ⊤ : Submodule R (Submodule.torsion R M)))

/-- At `n = 0` the quotient is zero. -/
theorem truncatedTorsionLength_zero (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]
    (π : R) : truncatedTorsionLength R M π 0 = 0 := by
  rw [truncatedTorsionLength, pow_zero, Ideal.span_singleton_one, Submodule.top_smul]
  exact Module.length_eq_zero

/-- Truncated torsion length is invariant under linear isomorphisms, including when its
value is infinite (README §5.2). -/
theorem truncatedTorsionLength_linearEquiv {R M M' : Type*} [CommRing R]
    [AddCommGroup M] [Module R M] [AddCommGroup M'] [Module R M']
    (f : M ≃ₗ[R] M') (π : R) (n : ℕ) :
    truncatedTorsionLength R M π n = truncatedTorsionLength R M' π n := by
  sorry

/-- A finitely generated module over a DVR has finite truncated torsion length for every
truncating scalar, in particular for a uniformizer (README §5.2). -/
theorem truncatedTorsionLength_ne_top (R M : Type*) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [AddCommGroup M] [Module R M] [Module.Finite R M]
    (π : R) (n : ℕ) : truncatedTorsionLength R M π n ≠ ⊤ := by
  sorry

/-- A torsion-free module has zero truncated torsion length. -/
example (R M : Type*) [CommRing R] [IsDomain R] [AddCommGroup M] [Module R M]
    [Module.IsTorsionFree R M] (π : R) (n : ℕ) : truncatedTorsionLength R M π n = 0 := by
  have h : Submodule.torsion R M = ⊥ :=
    Submodule.isTorsionFree_iff_torsion_eq_bot.mp inferInstance
  rw [truncatedTorsionLength, Module.length_eq_zero_iff]
  have : Subsingleton (Submodule.torsion R M) := by
    rw [h]; infer_instance
  infer_instance

/-- The degenerating-group pair: `ℤ/p²` and `(ℤ/p)²` have truncated lengths `1` and `2` at
`n = 1` and `2` and `2` at `n = 2`, although the second is killed by `p` and the first is not
(README §5.12; BMS1, Theorem 2.10 and its proof, pp.15–17). -/
theorem truncatedTorsionLength_cyclic_vs_split (p : ℕ) [Fact p.Prime] :
    truncatedTorsionLength ℤ (ZMod (p ^ 2)) (p : ℤ) 1 = 1 ∧
      truncatedTorsionLength ℤ (ZMod p × ZMod p) (p : ℤ) 1 = 2 ∧
      truncatedTorsionLength ℤ (ZMod (p ^ 2)) (p : ℤ) 2 = 2 ∧
      truncatedTorsionLength ℤ (ZMod p × ZMod p) (p : ℤ) 2 = 2 := by
  sorry

/-! ## Layer 6: Relative, product and arithmetic comparisons -/

/-- The quotient-line projective-bundle relation `∑_{i=0}^{n} (-1)^i c_i hⁿ⁻ⁱ` with `c₀ = 1`, as a
polynomial in `h = c₁(O(1))`: the relation by which Grothendieck's formalism defines Chern
classes, to which the proof of Betts–Stix, Proposition 3.20(8), p.28, reduces. -/
noncomputable def projectiveBundleRelation {R : Type*} [CommRing R] (n : ℕ) (c : ℕ → R) :
    R[X] :=
  ∑ i ∈ Finset.range (n + 1), C ((-1) ^ i * if i = 0 then 1 else c i) * X ^ (n - i)

end TauCetiRoadmap.CohomologyComparisons

/-
README constructions and supplier interfaces not declared here, because their carriers do not
exist at the pins or because they are not light definitions: the formal, analytic and crystalline dictionaries
and site compatibilities of Layer 0; `F_GR`, the Frobenius transport of GR’s coefficient
diagram to the canonical one; the A_inf input package and its de Rham, Hodge–Tate, Witt,
A_cris, étale and prismatic specializations of Layer 1;
`RelativeInfinitesimalSite` with `RelativeInfinitesimalSite.envelope`, `envelope_selfProduct`,
`envelope_cech` and `envelope_framing`, `PerfectPrismaticFCrystal`, `analyticToPerfect`,
`perfectCrystallineRealization`, `perfectRelativeCohomology` and the relative comparisons of Layer 2 (the canonical
deformation and envelope maps come from AInfCohomology §AI.6.5); the rational crystalline
comparisons; the supplied PrismaticCohomologyPartIII §7.0 interface `gradedBeilinsonSquare`
with `gradedBeilinsonSquare_map`, `gradedBeilinsonSquare_zero`,
`gradedBeilinsonSquare_cartesian`, `gradedBeilinsonSquare_integral` and
`gradedBeilinsonSquare_local`, and the nearby-cycle square of §3.8 for the arithmetic special
fibre `𝔛̄₀/k₀`, with tensor over `W(k₀)` through `W(k₀) → A_inf → A_cris`, the derived Frobenius
fibre and truncation of the nearby-cycle sheaf before global sections; the semistable and Beilinson
comparisons, the overconvergent `RigidHyodoKatoCohomology` and its proper-model log-crystalline
agreement, and proper rigid comparisons of Layer 4, including
§4.6's period and Hyodo–Kato agreements for PrismaticCohomologyPartIV's supplied logarithmic
comparisons; the torsion
inequalities, arithmetic `𝔖₀`-lattice recovery and counterexamples of Layer 5;
the shared abelian-family `smallHasseCanonicalSubgroups` with its reduction, uniqueness,
base-change, point, quotient and polarization API; `panModularTower`, the geometric full-component
`C`-tower with its commuting Galois and level actions, `panCompactificationRestriction` and
`panAlmostIntegralComparison`; the pro-Kummer tower over PrismaticCohomologyPartIV §8.60's
shared log structures and Kummer-étale site; `panLogPeriod` with `panLogPeriod_restrict`, `panLogPeriod_theta`,
`panLogPeriod_local`,
`panLogPeriod_connection` and `panLogPeriod_faltings`; `panBasis` with `panBasis_isBasis`,
`panBasis_perfectoid`, `panBasis_finiteLevel` and `panBasis_inter`, using nonempty finite intersections
and the empty open; `relativeFilteredComparison` with its `_functorial` and `_canonical` forms,
geometric base `Ā=A/I` and completed constant coefficients `H⁰(Spf(Ā)_η,Ẑ_p)`;
the trace period with `tracePeriod_spec`,
`tracePeriod_unique` and `tracePeriod_pow_zero`; `algebraicDeRhamTrace`, the de Rham Gysin and
cycle maps and the higher crystalline/de Rham/prismatic Chern class constructions and comparisons; and the
truncated period comparisons of Layer 6.
-/
