import Mathlib
import TauCetiRoadmap.SchemeAndStackFoundations.Suggested
import TauCetiRoadmap.PurityOfBranchLocus.Suggested

/-!
# EnhancedDerivedSheaves: representative target signatures

The roadmap is `README.md`. This file records the definitions and theorem signatures of the
roadmap that can be stated against the pinned Mathlib and Tau Ceti; it is not exhaustive.
The enhancement itself (the dg nerve, D∞(O), coherent towers, sheaves of spaces, Cat∞, operads,
presentable categories, animated rings and the cotangent complex) is not available at the pins,
so their comparisons and extensions are specified in the README. The generic higher-category
framework is supplied by BordismFormalGroups F6.5. The signatures below state the parts that
live on carriers the pinned libraries already have, with the conventions they fix:

* the point-site K-flat condition supplied by README §0.2;
* the global dimension of regular rings and Kunz's theorem, on Mathlib's `IsRegularRing`;
* Frobenius-root ideals and Tor independence of perfect `𝔽_p`-algebras;
* `𝔪`-saturation of modules over a valuation ring;
* pro-zero towers, which are a condition on transition maps and not on the limit;
* repleteness from `TauCetiRoadmap.SchemeAndStackFoundations` §2.17, with its countable-product
  consequence; weak contractibility of topos objects uses Mathlib's `CategoryTheory.Projective`;
* derived completeness of a module, through the elementary criterion that
  `(x_n) ↦ (x_n - f • x_{n+1})` is bijective on `ℕ → M` for every `f ∈ I`, and its comparison
  with Mathlib's classical `IsAdicComplete`.
-/

namespace TauCetiRoadmap.EnhancedDerivedSheaves

open CategoryTheory CategoryTheory.Limits Opposite
open scoped ZeroObject
open TauCetiRoadmap.SchemeAndStackFoundations.Proetale (IsReplete)

universe u v w z

/-! ## Layer E1: Unbounded derived sheaves and presentability -/

section KFlat

open MonoidalCategory

/-- The point-site K-flat condition of README §0.2 (Section E1.2): a complex
`P` of `R`-modules is K-flat when tensoring with it preserves acyclicity of every unbounded
complex. Termwise flatness is not the definition. The sheaf version replaces `ModuleCat R` by
`SheafOfModules O` with the sheafified tensor product. -/
def IsKFlat (R : Type u) [CommRing R] (P : CochainComplex (ModuleCat.{u} R) ℤ) : Prop :=
  ∀ A : CochainComplex (ModuleCat.{u} R) ℤ, A.Acyclic → (A ⊗ P).Acyclic

/-- A flat module concentrated in any integer degree is K-flat
(`isKFlat_single_of_flat`, README E1.2). -/
theorem isKFlat_single_of_flat (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Flat R M] (n : ℤ) :
    IsKFlat R ((HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.up ℤ) n).obj
      (ModuleCat.of R M)) := by
  sorry

/-- The acyclic constant-term complex over `ℤ/4` with successive differential multiplication
by `2` (`zmodFourTwoComplex`, Section E1.2). -/
noncomputable def zmodFourTwoComplex : CochainComplex (ModuleCat.{0} (ZMod 4)) ℤ := by
  classical
  exact
    { X := fun _ => ModuleCat.of (ZMod 4) (ZMod 4)
      d := fun i j => if (ComplexShape.up ℤ).Rel i j then
        ModuleCat.ofHom ((2 : ZMod 4) • LinearMap.id) else 0
      shape := fun i j h => by simp only [ite_eq_right h]
      d_comp_d' := fun i j k hij hjk => by
        simp only [ite_eq_left hij, ite_eq_left hjk]
        apply ModuleCat.hom_ext
        apply LinearMap.ext
        intro x
        change (2 : ZMod 4) • ((2 : ZMod 4) • x) = 0
        have htwo : (2 : ZMod 4) * 2 = 0 := by decide
        rw [smul_smul, htwo, zero_smul] }

/-- The unbounded termwise free complex with differential `2` over `ℤ/4` is not K-flat
(`zmodFourTwoComplex_not_isKFlat`, README E1.2). -/
theorem zmodFourTwoComplex_not_isKFlat : ¬ IsKFlat (ZMod 4) zmodFourTwoComplex := by
  sorry

end KFlat

section RegularRings

open IsLocalRing

/-- **Global dimension of regular rings** (`isRegularRing_projectiveDimension_le`, Section E1.6;
Stacks 00OE and 065T): over a regular ring of Krull dimension at most `d`, every module, finitely
generated or not, has projective dimension at most `d`. -/
theorem isRegularRing_projectiveDimension_le (R : Type u) [CommRing R] [IsRegularRing R] (d : ℕ)
    (hd : ringKrullDim R ≤ d) (M : ModuleCat.{u} R) : HasProjectiveDimensionLE M d := by
  sorry

/-- **Kunz's theorem, forward direction** (`frobenius_flat_of_isRegular`, Section E1.6; Stacks
0EC0): the absolute Frobenius of a regular ring of characteristic `p` is flat. -/
theorem frobenius_flat_of_isRegular (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime]
    [CharP R p] [IsRegularRing R] : (frobenius R p).Flat := by
  sorry

/-- **Kunz's theorem, converse** (`isRegular_of_frobenius_flat`, Section E1.6; BS17 Corollary
11.35): a Noetherian ring of characteristic `p` with flat Frobenius is regular. -/
theorem isRegular_of_frobenius_flat (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime]
    [CharP R p] [IsNoetherianRing R] (h : (frobenius R p).Flat) : IsRegularRing R := by
  sorry

end RegularRings

section PerfectRings

/-- **Frobenius-root ideals** (`frobeniusRootIdeal`, Section E1.6): the increasing union of the
ideals generated by the `p^n`-th roots of `f` in a perfect `𝔽_p`-algebra
(BS17, proof of Lemma 3.16). -/
def frobeniusRootIdeal (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime] [CharP R p]
    [PerfectRing R p] (f : R) : Ideal R :=
  ⨆ n : ℕ, Ideal.span {(iterateFrobeniusEquiv R p n).symm f}

/-- The Frobenius-root ideal equals `√(f)` (`frobeniusRootIdeal_radical`, Section E1.6). -/
theorem frobeniusRootIdeal_radical (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime]
    [CharP R p] [PerfectRing R p] (f : R) :
    frobeniusRootIdeal R p f = (Ideal.span {f}).radical := by
  sorry

/-- The `p^n`-th roots of `f` lie in `J_f` (`frobeniusRootIdeal_root_mem`). -/
theorem frobeniusRootIdeal_root_mem (R : Type u) [CommRing R] (p : ℕ)
    [Fact p.Prime] [CharP R p] [PerfectRing R p] (f : R) (n : ℕ) :
    (iterateFrobeniusEquiv R p n).symm f ∈ frobeniusRootIdeal R p f := by
  sorry

/-- **Flatness and idempotence of Frobenius-root ideals** (`frobeniusRootIdeal_flat`,
BS17 proof of Lemma 3.16). -/
theorem frobeniusRootIdeal_flat (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime] [CharP R p]
    [PerfectRing R p] (f : R) :
    Module.Flat R (frobeniusRootIdeal R p f) ∧
      frobeniusRootIdeal R p f * frobeniusRootIdeal R p f = frobeniusRootIdeal R p f := by
  sorry

/-- **Tor independence of perfect algebras** (`perfectRing_tor_eq_zero`, BS17 Lemma 3.16).
All three rings are perfect; the statement is false for arbitrary modules over a perfect ring
(README, `perfectRing_tor_dimension_counterexample`). -/
theorem perfectRing_tor_eq_zero (A B C : Type u) [CommRing A] [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] (p : ℕ) [Fact p.Prime]
    [CharP A p] [CharP B p] [CharP C p]
    [PerfectRing A p] [PerfectRing B p] [PerfectRing C p] (i : ℕ) :
    IsZero (((CategoryTheory.Tor (ModuleCat.{u} A) (i + 1)).obj (ModuleCat.of A B)).obj
      (ModuleCat.of A C)) := by
  sorry

/-- The quotient of a perfect polynomial algebra by the radical of `m` equations has
Tor dimension at most `m` over the base (`perfectPresentation_torDimension_le`, README E1.6;
BS17 Proposition 11.29). -/
theorem perfectPresentation_torDimension_le (R : Type u) [CommRing R]
    (p : ℕ) [Fact p.Prime] [CharP R p] [PerfectRing R p]
    (n m : ℕ) (f : Fin m → MvPolynomial (Fin n) R) (M : ModuleCat.{u} R) (i : ℕ) :
    let P := PerfectClosure (MvPolynomial (Fin n) R) p
    letI : Algebra R P :=
      ((PerfectClosure.of (MvPolynomial (Fin n) R) p).comp MvPolynomial.C).toAlgebra
    let S := P ⧸ (Ideal.span (Set.range
      (fun j => PerfectClosure.of (MvPolynomial (Fin n) R) p (f j)))).radical
    IsZero (((CategoryTheory.Tor (ModuleCat.{u} R) (m + i + 1)).obj
      (ModuleCat.of R S)).obj M) := by
  sorry

/-- Every module over a perfect quotient of the perfection of a regular ring of
dimension at most `d` has projective dimension at most `d + 1`
(`perfect_projectiveDimension_le`, README E1.6; BS17 proof of Proposition 11.31). -/
theorem perfect_projectiveDimension_le (P₀ R : Type u) [CommRing P₀] [CommRing R]
    (p : ℕ) [Fact p.Prime] [CharP P₀ p] [CharP R p] [PerfectRing R p]
    [IsRegularRing P₀] (d : ℕ) (hd : ringKrullDim P₀ ≤ d)
    [Algebra (PerfectClosure P₀ p) R]
    (hsurj : Function.Surjective (algebraMap (PerfectClosure P₀ p) R))
    (M : ModuleCat.{u} R) : HasProjectiveDimensionLE M (d + 1) := by
  sorry

end PerfectRings

section ValuationModules

/-- The multiplication map `M → Hom_V(𝔪, M)`, `x ↦ (a ↦ a • x)` (`valuationSaturationMap`,
Section E1.7). -/
def valuationSaturationMap (V : Type u) [CommRing V] (m : Ideal V)
    (M : Type v) [AddCommGroup M] [Module V M] : M →ₗ[V] (m →ₗ[V] M) where
  toFun x :=
    { toFun := fun a => (a : V) • x
      map_add' := fun a b => by simp [add_smul]
      map_smul' := fun c a => by simp [mul_smul] }
  map_add' x y := by ext a; simp [smul_add]
  map_smul' c x := by ext a; simp [smul_comm (a : V) c x]

/-- **`𝔪`-saturated modules** (`IsValuationSaturated`, Section E1.7, BS17 Lemma 6.14): the
multiplication map `M → Hom_V(𝔪, M)` is bijective. For a nonarchimedean field with
`|K×| = ℝ_{>0}`, a nonzero open ball of finite positive radius fails this, while a closed
ball satisfies it. An open ball with radius outside the value group can be saturated. -/
def IsValuationSaturated (V : Type u) [CommRing V] (m : Ideal V)
    (M : Type v) [AddCommGroup M] [Module V M] : Prop :=
  Function.Bijective (valuationSaturationMap V m M)

end ValuationModules

/-! ## Layer E2:towers: Coherent towers and pro-towers -/

section ProTowers

/-- **Pro-zero towers** (`IsProZero`, Section E2:towers.2): every stage is killed by a later
transition map. This is a condition on transitions, not on the limit. -/
def IsProZero {A : Type u} [Category.{v} A] [HasZeroMorphisms A] (F : ℕᵒᵖ ⥤ A) : Prop :=
  ∀ n : ℕ, ∃ m : ℕ, ∃ h : n ≤ m, F.map (homOfLE h).op = 0

/-- Ordinary abelian pro-isomorphisms have pro-zero kernel and cokernel towers. This
predicate is distinct from the stable null-transition condition used for descendability. -/
def IsProIsomorphism {A : Type u} [Category.{v} A] [Abelian A]
    {F G : ℕᵒᵖ ⥤ A} (f : F ⟶ G) : Prop :=
  IsProZero (kernel f) ∧ IsProZero (cokernel f)

/-- Cofinal monotone reindexing preserves and reflects pro-zero towers
(`proZero_cofinal`, README E2:towers.2). -/
theorem proZero_cofinal {A : Type u} [Category.{v} A] [HasZeroMorphisms A]
    (F : ℕᵒᵖ ⥤ A) (φ : ℕ → ℕ) (hφ : Monotone φ)
    (hcofinal : ∀ n, ∃ m, n ≤ φ m) :
    IsProZero (hφ.functor.op ⋙ F) ↔ IsProZero F := by
  sorry

/-- Pro-isomorphisms compose (`proIso_comp`). -/
theorem proIso_comp {A : Type u} [Category.{v} A] [Abelian A]
    {F G H : ℕᵒᵖ ⥤ A} {f : F ⟶ G} {g : G ⟶ H}
    (hf : IsProIsomorphism f) (hg : IsProIsomorphism g) : IsProIsomorphism (f ≫ g) := by
  sorry

/-- The tower `ℤ ← ℤ ← ⋯` whose transitions are multiplication by `p`. -/
noncomputable def pMultiplicationTower (p : ℕ) : ℕᵒᵖ ⥤ ModuleCat.{0} ℤ :=
  Functor.ofOpSequence (X := fun _ => ModuleCat.of ℤ ℤ)
    (fun _ => ModuleCat.ofHom ((p : ℤ) • LinearMap.id))

/-- A tower whose successive transitions are zero is pro-zero, whatever its terms. -/
example (A : Type u) [Category.{v} A] [Abelian A] (F : ℕᵒᵖ ⥤ A)
    (hF : ∀ n, F.map (homOfLE (Nat.le_succ n)).op = 0) : IsProZero F :=
  fun n => ⟨n + 1, Nat.le_succ n, hF n⟩

/-- Multiplication by a prime `p` on `ℤ` is not pro-zero, although its limit is zero
(`pMultiplicationTower_not_isProZero`, README E2:towers.2). -/
theorem pMultiplicationTower_not_isProZero (p : ℕ) (hp : p.Prime) :
    ¬ IsProZero (pMultiplicationTower p) := by
  sorry

end ProTowers

/-! ## Layer E2: Repleteness, inverse limits, Postnikov convergence and descent -/

section Replete

/-- Slices of a replete topos are replete (`IsReplete.over`, README E2.1;
BS-proet Lemma 3.1.2). -/
theorem IsReplete.over {C : Type u} [SmallCategory C] (J : GrothendieckTopology C)
    (hJ : IsReplete (Sheaf J (Type u))) (U : Sheaf J (Type u)) :
    IsReplete (Over U) := by
  sorry

/-- Repleteness descends from the slice over a cover of the terminal object
(`IsReplete.of_over_epi`, README E2.1; BS-proet Lemma 3.1.3). -/
theorem IsReplete.of_over_epi {C : Type u} [SmallCategory C] (J : GrothendieckTopology C)
    (U : Sheaf J (Type u)) [Epi (terminal.from U)] (hU : IsReplete (Over U)) :
    IsReplete (Sheaf J (Type u)) := by
  sorry

/-- Repleteness is invariant under equivalence (`IsReplete.of_equivalence`, Section E2.1). -/
theorem IsReplete.of_equivalence {C : Type u} [Category.{v} C]
    {D : Type w} [Category.{z} D] (e : C ≌ D) (hC : IsReplete C) : IsReplete D := by
  sorry

/-- A relatively epimorphic map of towers induces an epimorphism of limits
(`IsReplete.lim_map_epi`, README E2.1; BS-proet Lemma 3.1.8). The initial map and
each map to the relative matching pullback are epimorphic. -/
theorem IsReplete.lim_map_epi {C : Type u} [SmallCategory C] (J : GrothendieckTopology C)
    (hJ : IsReplete (Sheaf J (Type u))) {F G : ℕᵒᵖ ⥤ Sheaf J (Type u)} (f : F ⟶ G)
    (hzero : Epi (f.app (op 0)))
    (hstep : ∀ n : ℕ, Epi (pullback.lift
      (F.map (homOfLE (Nat.le_succ n)).op) (f.app (op (n + 1)))
      (f.naturality (homOfLE (Nat.le_succ n)).op))) :
    Epi (lim.map f) := by
  sorry

/-- **Countable products in a replete topos** (`IsReplete.countableProduct_epi`,
BS-proet Proposition 3.1.9): a countable product of epimorphisms of sheaves of sets is an
epimorphism. -/
theorem IsReplete.countableProduct_epi {C : Type u} [SmallCategory C]
    (J : GrothendieckTopology C) (hJ : IsReplete (Sheaf J (Type u)))
    {X Y : ℕ → Sheaf J (Type u)} (f : ∀ n, X n ⟶ Y n) (hf : ∀ n, Epi (f n)) :
    Epi (Limits.Pi.map f) := by
  sorry

end Replete

/-! ## Layer E4: Derived completion of sheaves and coefficient reconstruction -/

section DerivedComplete

/-- The elementary point-site telescope criterion (`IsDerivedComplete`, Section E4.1).
For `f ∈ I` the derived limit of `M ←f M ←f ⋯` is the fibre of
`(x_n) ↦ (x_n - f • x_{n+1})` on `ℕ → M`; `M` is derived `I`-complete when this map is
bijective for every `f ∈ I`. -/
def IsDerivedComplete {R : Type u} [CommRing R] (I : Ideal R) (M : Type v) [AddCommGroup M]
    [Module R M] : Prop :=
  ∀ f ∈ I, Function.Bijective (fun x : ℕ → M => fun n => x n - f • x (n + 1))

/-- Telescope completeness agrees with the shifted-localization criterion of
`DerivedDeRham.derivedCompleteness` on `M[0]` (`isDerivedComplete_iff_derivedCompleteness`,
Section E4.1; BS-proet Lemma 3.4.7; Stacks 091P). -/
theorem isDerivedComplete_iff_derivedCompleteness (R : Type u) [CommRing R]
    [HasDerivedCategory.{u + 1} (ModuleCat.{u} R)] (I : Ideal R) (hI : I.FG)
    (M : Type u) [AddCommGroup M] [Module R M] :
    IsDerivedComplete I M ↔ ∀ f ∈ I, ∀ n : ℤ,
      Subsingleton
        (((DerivedCategory.singleFunctor (ModuleCat.{u} R) 0).obj
          (ModuleCat.of R (Localization.Away f)))⟦n⟧ ⟶
          (DerivedCategory.singleFunctor (ModuleCat.{u} R) 0).obj (ModuleCat.of R M)) := by
  sorry

/-- For the zero ideal every module is derived complete. -/
example {R : Type u} [CommRing R] (M : Type v) [AddCommGroup M] [Module R M] :
    IsDerivedComplete (⊥ : Ideal R) M := by
  intro f hf
  rw [Submodule.mem_bot] at hf
  subst hf
  simp only [zero_smul, sub_zero]
  exact Function.bijective_id

/-- A countable direct sum of p-adic integers is not derived p-complete
(`derivedComplete_directSum_counterexample`, README E4.1). -/
theorem derivedComplete_directSum_counterexample (p : ℕ) [Fact p.Prime] :
    ¬ IsDerivedComplete (Ideal.span {(p : ℤ_[p])}) (ℕ →₀ ℤ_[p]) := by
  sorry

/-- **Classical and derived completeness** (`isAdicComplete_iff_derivedComplete_separated`,
BS-proet Proposition 3.4.2, point case): for a finitely generated ideal, a module is classically
`I`-adically complete exactly when it is derived `I`-complete and `I`-adically separated. -/
theorem isAdicComplete_iff_derivedComplete_separated {R : Type u} [CommRing R]
    (I : Ideal R) (hI : I.FG) (M : Type v) [AddCommGroup M] [Module R M] :
    IsAdicComplete I M ↔ IsDerivedComplete I M ∧ IsHausdorff I M := by
  sorry

/-- **Weak Serre closure** (`derivedCompleteModules_weakSerre`, point case): derived complete
modules are closed under kernels and cokernels of maps between derived complete modules. They
are not closed under submodules: `ℤ ⊆ ℤ_[p]`. -/
theorem derivedCompleteModules_weakSerre {R : Type u} [CommRing R] (I : Ideal R)
    {M N : Type v} [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    (hM : IsDerivedComplete I M) (hN : IsDerivedComplete I N) (g : M →ₗ[R] N) :
    IsDerivedComplete I (LinearMap.ker g) ∧ IsDerivedComplete I (N ⧸ LinearMap.range g) := by
  sorry

/-- A derived `p`-complete module need not be `p`-adically separated (BS-proet Remark 3.4.3):
the cokernel of `b ↦ −(Σ_{n≥1} b_n)e₀ + Σ_{n≥1} pⁿb_n e_n` on the p-adic completion of
`⊕_{n≥0} ℤ_[p]` (`derivedComplete_not_separated`, README E4.3). -/
theorem derivedComplete_not_separated (p : ℕ) [Fact p.Prime] :
    ∃ (M : Type) (_ : AddCommGroup M) (_ : Module ℤ_[p] M),
      IsDerivedComplete (Ideal.span {(p : ℤ_[p])}) M ∧
        ¬ IsHausdorff (Ideal.span {(p : ℤ_[p])}) M := by
  sorry

end DerivedComplete

/-
The README also specifies API beyond the representative statements above:
* §§0.1–0.4: ClassicalDerived.enhancedCategory, ClassicalDerived.replacements,
  ClassicalDerived.tensorHom, ClassicalDerived.inverseLimits,
  ClassicalDerived.inverseLimits.moduleComparison, ClassicalDerived.derivedCompletion,
  ClassicalDerived.derivedCompletion.moduleComparison, ClassicalDerived.functorCoherence and
  ClassicalDerived.functorCoherence.coefficientComparison specify ringed-site constructions
  and their module and coefficient comparisons; their carriers are not at the pins.
* E0 uses BordismFormalGroups F6.5 for the generic quasicategorical constructions.
  E5:presentability.1 adds `indOrdinaryComparison` and `indCompactComparison` for its Ind.
  The relative Kan-extension lifting theorem of E3.1 uses its categorical fibrations.
* E1.2: `replacementDGComparison` compares the replacements supplied by
  README §0.2 with the dg realization; `IsKFlat` spells its point-site
  acyclicity condition. E1.5 `koszulEnhancedComparison` reindexes the Koszul complex supplied
  by DerivedModuleAlgebra §0.K.1.
* E1.F3.H1: `DerivedDeRham.moduleDerivedHom.pointSiteComparison` identifies the
  point-site internal Hom with the ordinary module derived Hom supplied by
  DerivedModuleAlgebra §1.1.1, compatibly with its tensor–Hom adjunction, shifts and
  unit, extension-class and nonperfect-localization computations.
* E1.8.DMA.1: `derivedTensor_affine`, in namespace `DerivedDeRham`, compares the module
  tensor of DerivedModuleAlgebra §0.2 with SchemeAndStackFoundations §2.18 on `Spec R`.
* E1.9: `spaceProperSupport_coherent` supplies coherent higher direct images and
  bounded coherent pushforward for locally finite type quasi-separated maps of algebraic
  spaces to a Noetherian base, with proper cohomological support. It includes proper
  coherence for spaces and the finite cohomological bound. `spaceProperSupport_perfect`
  adds finite Tor dimension over the target and concludes perfect pushforward, including
  the case of a perfect factor tensored with a bounded coherent target-flat complex.
  `spaceProperSupport_approximation` descends a finitely presented algebraic space, its
  bounded finitely presented target-flat complex with proper supports, and its perfect
  factor to a common Noetherian stage, with ordinary pullback of the coefficient complex
  and derived pullback of the perfect factor.
  `perfect_proper_pushforward` states perfectness and arbitrary base change
  for `Rf_*(E ⊗ᴸ G•)` on algebraic spaces, with `E` perfect and `G•` bounded, finitely
  presented, termwise target-flat and with proper support. Its base-change formula is
  `Lg* Rf_*(E ⊗ᴸ G•) ≃ Rf'_*(Lg'^*E ⊗ᴸ g'^*G•)`, with the second factor pulled
  back termwise ordinarily, as in Stacks 0A1K/0A1P. The finite affine example
  `A = k[t]`, `B = A[ε]/(tε, ε²)`, `C = B/tB`, `G = B/(ε)` has
  `Tor₂^B(A,C) = k`, distinguishing ordinary from derived pullback of `G`.
  These carriers are README targets.
* E5:spectra-comparison: `eilenbergMacLane` and `moduleSpectra_equiv_derived` are
  abstract exports. `symmetricSpectra_equiv_spectra` compares GeneralizedCohomology G2's
  concrete spectra, enhanced through BordismFormalGroups F6.5, with abstract Sp. It
  preserves the sphere, the suspension-spectrum adjunction, integer shifts and mapping
  spectra, identifies concrete HR in CAlg(Sp), and routes its rectified module fibres
  through `moduleSpectra_equiv_derived`. `symmetricSpectra_towerComparison` compares G3.8–G3.9's
  coherent localization and completion towers with their units and transitions. Its
  HR-module specialization follows E4.2's Koszul comparison; ordinary quotients require
  the hypotheses of `regularIdeal_quotients`. The positive-flat model uses the supplied
  unit-adjoined localization, with no cofibrant-unit assumption on that model.
* E1.6: `frobeniusRootIdeal_radical` and `frobeniusRootIdeal_colimit` identify the root ideal
  with the radical and its sequential colimit presentation.
* E2.2–E2.3: `IsReplete.rlim_amplitude`,
  `IsReplete.rlim_eq_zero_of_proZero` and `IsReplete.postnikov_counit` are the cover,
  derived-limit and enhanced Postnikov targets.
* E2:towers.1: `derivedLimitFiltration` filters the mapping groups `[z[n], lim X]`
  for a coherent diagram indexed by the opposite of a small filtered category of finite
  inverse-limit cohomological dimension d. Its tensor pairing has codomain
  `[z ⊗ w, lim_i (X_i ⊗ Y_i)]`, through the canonical comparison from the tensor of
  limits. It is filtered, so d + 1 positive-filtration classes have zero external product
  there. Internal products additionally use a coherent diagram of algebra objects and
  a coalgebra diagonal on z. The mapping-out-of-a-colimit theorem
  `towerLimit_lim1_mul_eq_zero` uses its separate tensor/sequential-colimit preservation
  hypothesis; nilpotence is not asserted in the tensor of two limits.
* E2.5: `projective_sections_exact` gives exact sections on abelian sheaves over projective objects.
* E2.8: `properHigherDirectImage_coherent` identifies cohomology of enhanced proper
  pushforward of a coherent sheaf with the ordinary higher direct images supplied by
  JacobianChallenge Layer C over a locally Noetherian scheme base, without flatness of
  the map or coefficient. For a quasicompact base it also gives bounded coherent
  pushforward using the finite affine cohomological bound. Ordinary scheme proper
  coherence and finite affine cohomology are consumed from that supplier.
SchemeAndStackFoundations §2.17 supplies `IsReplete.lim_epi`, `IsReplete.derived_limits`
and `IsReplete.derivedCategory_leftComplete`; its predicate is imported above.

The remaining constructions use carriers that are not at the pins: the supplied joins, slices,
mapping spaces, Cat∞, Spaces and straightening, with the dg nerve and presentability
extensions (Layer E0); D∞(O), the derived tensor
product and internal Hom, ringed pullback and pushforward, the supplied Koszul comparison, Dqc and base change
on perfect schemes (Layer E1); Kan extensions, adjoints, localizations and mates (Layer E3);
coherent towers and derived-limit filtrations (Layer E2:towers); operadic algebra and scalar
extension on the supplied monoidal framework, derived families, idempotent completion and
Barr–Beck–Lurie (Layer E5:abstract); comparisons for the supplied Ind,
PrL, PrR, limits along left and right adjoints, spectra, dualizable and rigid categories
(Layer E5:presentability); descendable algebras (Layer E5:descent); animated rings and bounded
totalizations in spaces, spectra and module categories (Layer E5:animation); Postnikov completion, hypercover
descent, sheaves of spaces and h-descent (Layer E2); sheaf completion and coefficient
reconstruction (Layer E4); the animated cotangent and power comparisons (Layer E5:cotangent-export); and the
Eilenberg–Mac Lane comparison (Layer E5:spectra-comparison).
-/

end TauCetiRoadmap.EnhancedDerivedSheaves
