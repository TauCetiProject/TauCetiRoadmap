module

public import Mathlib
public import TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic
public import TauCeti.Algebra.Category.ModuleCat.FiniteProjective.ScalarChange
public import TauCeti.CategoryTheory.GrothendieckGroup.Split
public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Stable

/-!
# Algebraic K-theory in low degrees: target signatures

The roadmap is `README.md`; this file is not the roadmap and is not exhaustive. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`,
together with the few definitions with real bodies that they need.

The elementary subgroup `Eₙ(R)` over an arbitrary ring, Whitehead's lemma, the stable groups
`GL(R)` and `E(R)` and algebraic `K₁(R)` are Tau Ceti's `TauCeti.elementarySubgroup`,
`TauCeti.fromBlocksGL_commutatorElement_mem_elementarySubgroup`,
`TauCeti.StableGeneralLinearGroup` and `TauCeti.AlgebraicK1`; they are used here and not stated
again. The Dieudonné determinant and Bass–Vaserstein stability are stated at finite matrix size,
which is the form in which they are proved.

Headline theorems of the roadmap that are not statable at the pins:

* The boundary `δ : K₁(Q) → K₀(D)` of the Milnor exact sequence of A6, and exactness at `K₁(Q)`
  and `K₀(D)`: the boundary `δ([u]) = [M(u)] − [Dⁿ]` needs the patched module
  `M(u) = {(a, b) | u π₁(a) = π₂(b)}` of 6.2 and 6.3 as an object of `FiniteProjectiveRight D`,
  that is, the finite projectivity that `milnor_patching` proves, so its definition is itself a
  theorem. The other two exactness statements are stated below: `kOne_mayerVietoris_exact` at
  `K₁(A₁) × K₁(A₂)`, with the `K₁` map of a ring homomorphism `kOneMap` built from the pinned
  universal property `TauCeti.AlgebraicK1.lift`, and `kZero_mayerVietoris_exact` at
  `K₀(A₁) × K₀(A₂)`, with the `K₀` map `kZeroMap`, which is `TauCeti.SplitK0.map` of the pinned
  extension-of-scalars functor on finitely generated projective modules. The patching
  equivalence of A6 is stated below as `milnor_patching`: the category of patching triples is
  Mathlib's categorical pullback of two such functors, and the comparison functor is built from
  the pinned adjunction `TauCeti.BalancedExtension.adjunction` by uniqueness of left adjoints.
* The identification of the torsion class of 7.2 with `[M(2)] − [D]`: it needs the patched module
  `M(2)` as an object of `FiniteProjectiveRight D`, for the same reason. The kernels
  `ker f₀ ≅ ℤ/2` and `ker f₀ ≅ ℤ/5` of 7.2, which mention only `kZeroMap`, are stated below inside
  the two values of `K₀`: the kernel of `f₀` is the preimage of the torsion factor under the
  stated decomposition.
* The identification of the patched modules of 7.1 with glued bundles: this needs the section
  modules of continuous bundles, which neither library has.
* The Chern number `+2` of the tangent complex line of 0.6: it needs the first Chern class of a
  complex line bundle, which neither library has.
* The relative exact sequences of A3: they need the relative group `K₁(R, I)` of 3.1, A3's
  relative triple group `K₀(T)` of an additive functor and A2's automorphism presentation `K₁ᴮ`
  of a small additive category, which neither library has.
* The surjection of algebraic `K₁` of a Banach algebra `A` onto its stable component group, the
  colimit of `GLₙ(A)/GLₙ(A)₀`, and its kernel (A8): the stable component group, the quotient of
  `TauCeti.StableGeneralLinearGroup A` by the union of the images of the identity components
  `GLₙ(A)₀`, is in neither library, and forming that quotient group needs the theorem that this
  union is a normal subgroup.
-/

@[expose] public section

namespace TauCetiRoadmap.AlgebraicKTheory

open CategoryTheory Matrix

universe u v w

/-! ## Layer A0: Finite projectives and matrix K₀ -/

/-- Finitely generated projective right `R`-modules, as left modules over `Rᵐᵒᵖ`, using the
existing Tau Ceti full subcategory. -/
abbrev FiniteProjectiveRight (R : Type u) [Ring R] :=
  (TauCeti.finiteProjectiveModules Rᵐᵒᵖ).FullSubcategory

/-- `K₀(R)`: the split Grothendieck group of finitely generated projective right `R`-modules. -/
abbrev KZero (R : Type u) [Ring R] :=
  TauCeti.SplitK0.{u} (FiniteProjectiveRight R)

/-- `K₀(f) : K₀(R) → K₀(S)` for a ring homomorphism `f : R →+* S`: `TauCeti.SplitK0.map` of Tau
Ceti's extension-of-scalars functor on finitely generated projective modules along
`fᵐᵒᵖ : Rᵐᵒᵖ →+* Sᵐᵒᵖ`, so that `[P] ↦ [P ⊗_R S]` (Weibel, *The K-book*, Chapter II, §2.8 and
Example 2.8.1, chapter p. 13). The pinned functor takes `R` and `S` in one universe. -/
noncomputable def kZeroMap {R S : Type u} [Ring R] [Ring S] (f : R →+* S) :
    KZero R →+ KZero S :=
  TauCeti.SplitK0.map (RingHom.op f).finiteProjectiveModulesExtendScalars

/-- Tau Ceti's extension-of-scalars functor on finitely generated projective modules followed by
the inclusion into all modules is the inclusion followed by the balanced extension of scalars
`P ↦ S ⊗_R P` on all modules: the natural isomorphism whose components are the identifications
`RingHom.finiteProjectiveModulesExtendScalars_obj_obj`. -/
noncomputable def extendScalarsιIso {R S : Type u} [Ring R] [Ring S] (f : R →+* S) :
    f.finiteProjectiveModulesExtendScalars ⋙ (TauCeti.finiteProjectiveModules S).ι ≅
      (TauCeti.finiteProjectiveModules R).ι ⋙ TauCeti.BalancedExtension.functor.{u, u, u} f :=
  NatIso.ofComponents (fun P => eqToIso (f.finiteProjectiveModulesExtendScalars_obj_obj P))
    (fun {X Y} g => by
      dsimp only [eqToIso, Functor.comp_map, ObjectProperty.ι_map]
      rw [RingHom.finiteProjectiveModulesExtendScalars_map_hom, Category.assoc, Category.assoc]
      erw [eqToHom_trans, eqToHom_refl, Category.comp_id]
      rfl)

/-- Extension of scalars of finitely generated projective modules along the two sides of a
commuting square `g₁ ∘ f₁ = g₂ ∘ f₂` of ring homomorphisms, as a natural isomorphism between the
two composite functors. On all modules the composite adjunctions `E(f₁) ⋙ E(g₁) ⊣ Res(g₁) ⋙ Res(f₁)`
and `E(f₂) ⋙ E(g₂) ⊣ Res(g₂) ⋙ Res(f₂)` of `TauCeti.BalancedExtension.adjunction` have right
adjoints that `ModuleCat.restrictScalarsComp'` identifies with `Res(g₁ ∘ f₁)`, so
`Adjunction.leftAdjointUniq` identifies their left adjoints compatibly with the units: the
component sends `1 ⊗ (1 ⊗ p)` to `1 ⊗ (1 ⊗ p)`. Full faithfulness of the inclusion of finitely
generated projective modules carries it to the functors of
`RingHom.finiteProjectiveModulesExtendScalars`. Applied along opposite rings it is the composition
isomorphism of right-module extension (`(P ⊗ B) ⊗ D ≅ P ⊗ D ≅ (P ⊗ C) ⊗ D`). -/
noncomputable def extendScalarsCompIso {A B C D : Type u} [Ring A] [Ring B] [Ring C] [Ring D]
    (f₁ : A →+* B) (g₁ : B →+* D) (f₂ : A →+* C) (g₂ : C →+* D) (h : g₁.comp f₁ = g₂.comp f₂) :
    f₁.finiteProjectiveModulesExtendScalars ⋙ g₁.finiteProjectiveModulesExtendScalars ≅
      f₂.finiteProjectiveModulesExtendScalars ⋙ g₂.finiteProjectiveModulesExtendScalars :=
  ((TauCeti.finiteProjectiveModules D).fullyFaithfulι.whiskeringRight _).preimageIso
    (Functor.associator _ _ _ ≪≫
      Functor.isoWhiskerLeft _ (extendScalarsιIso g₁) ≪≫
      (Functor.associator _ _ _).symm ≪≫
      Functor.isoWhiskerRight (extendScalarsιIso f₁) _ ≪≫
      Functor.associator _ _ _ ≪≫
      Functor.isoWhiskerLeft (TauCeti.finiteProjectiveModules A).ι
        (((TauCeti.BalancedExtension.adjunction.{u, u, u} f₁).comp
            (TauCeti.BalancedExtension.adjunction.{u, u, u} g₁)).leftAdjointUniq
          (((TauCeti.BalancedExtension.adjunction.{u, u, u} f₂).comp
            (TauCeti.BalancedExtension.adjunction.{u, u, u} g₂)).ofNatIsoRight
              ((ModuleCat.restrictScalarsComp' f₂ g₂ (g₁.comp f₁) h).symm ≪≫
                ModuleCat.restrictScalarsComp' f₁ g₁ (g₁.comp f₁) rfl))) ≪≫
      (Functor.associator _ _ _).symm ≪≫
      Functor.isoWhiskerRight (extendScalarsιIso f₂).symm _ ≪≫
      Functor.associator _ _ _ ≪≫
      Functor.isoWhiskerLeft _ (extendScalarsιIso g₂).symm ≪≫
      (Functor.associator _ _ _).symm)

/-- `K₀` of a division ring is `ℤ`, with the class of the free module of rank one going to `1`
(Weibel, *The K-book*, Chapter II, §2, the division-ring example before Lemma 2.1). -/
theorem kZero_divisionRing (D : Type u) [DivisionRing D] :
    ∃ e : KZero D ≃+ ℤ,
      e (TauCeti.SplitK0.of
        (⟨ModuleCat.of Dᵐᵒᵖ Dᵐᵒᵖ,
          TauCeti.finiteProjectiveModules_iff.mpr ⟨inferInstance, inferInstance⟩⟩ :
          FiniteProjectiveRight D)) =
        1 := by
  sorry

/-- `K₀(ℤ)` is `ℤ`, with the class of the free module of rank one going to `1`
(Weibel, *The K-book*, Chapter II, §2, chapter p. 5). -/
theorem kZero_int :
    ∃ e : KZero ℤ ≃+ ℤ,
      e (TauCeti.SplitK0.of
        (⟨ModuleCat.of ℤᵐᵒᵖ ℤᵐᵒᵖ,
          TauCeti.finiteProjectiveModules_iff.mpr ⟨inferInstance, inferInstance⟩⟩ :
          FiniteProjectiveRight ℤ)) =
        1 := by
  sorry

/-- The coordinate functions `x ↦ xᵢ` on the unit sphere `S² ⊂ ℝ³`, as elements of the ring
`C(S², ℝ)`. -/
noncomputable def sphereCoord (i : Fin 3) :
    C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ) :=
  ⟨fun x => EuclideanSpace.proj i (x : EuclideanSpace ℝ (Fin 3)),
    (EuclideanSpace.proj i).continuous.comp continuous_subtype_val⟩

/-- The tangent-section module of 0.5 over `R = C(S², ℝ)`: the triples `v = (v₀, v₁, v₂)` in `R³`
with `∑ xᵢ vᵢ(x) = 0` at every point `x` of the sphere, that is, the continuous fields
`v : S² → ℝ³` with `⟨x, v(x)⟩ = 0`. It is the kernel of `v ↦ ∑ xᵢ vᵢ`, and the image of the
idempotent `p(x) = I₃ − x xᵀ`. -/
noncomputable def tangentSections :
    Submodule C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)
      (Fin 3 → C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)) :=
  LinearMap.ker (∑ i, sphereCoord i • (LinearMap.proj i :
    (Fin 3 → C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)) →ₗ[
      C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)]
      C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)))

/-- Cancellation fails over `C(S², ℝ)`: the tangent-section module `P` satisfies `P ⊕ R ≅ R³`,
through `(v, f) ↦ (x ↦ v(x) + f(x) x)`, but is not free, by the hairy ball theorem for `S²`
(the continuous-function form of Weibel, *The K-book*, Chapter I, Example 1.2.2, which treats
the polynomial ring of the sphere). -/
theorem tangentSections_stablyFree_not_free :
    Nonempty ((tangentSections × C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)) ≃ₗ[
      C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ)]
      (Fin 3 → C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ))) ∧
    ¬ Module.Free C(Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1, ℝ) tangentSections := by
  sorry

/-- The functions `[t] ↦ cos 2πt` and `[t] ↦ sin 2πt` on the circle `T = ℝ/ℤ`, Mathlib's
`AddCircle 1`, as the real and imaginary parts of `AddCircle.toCircle`. -/
noncomputable def circleCoord (i : Fin 2) : C(AddCircle (1 : ℝ), ℝ) :=
  ⟨fun x => if i = 0 then (AddCircle.toCircle x : ℂ).re else (AddCircle.toCircle x : ℂ).im,
    continuous_if_const _
      (fun _ => Complex.continuous_re.comp
        (continuous_induced_dom.comp AddCircle.continuous_toCircle))
      (fun _ => Complex.continuous_im.comp
        (continuous_induced_dom.comp AddCircle.continuous_toCircle))⟩

/-- The Möbius module of 0.7 over `R = C(T, ℝ)`: the pairs `w ∈ R²` fixed by the reflection
`ρ([t]) = [[cos 2πt, sin 2πt], [sin 2πt, −cos 2πt]]`, that is, the continuous fields with
`w([t])` on the line spanned by `u(t) = (cos πt, sin πt)`. Since `ρ = 2p − 1` for the idempotent
`p = u uᵀ`, it is the image `pR²` of 0.7, which `v ↦ ([t] ↦ v(t) u(t))` identifies with the
antiperiodic functions. -/
noncomputable def mobiusSections :
    Submodule C(AddCircle (1 : ℝ), ℝ) (Fin 2 → C(AddCircle (1 : ℝ), ℝ)) :=
  LinearMap.ker (Matrix.mulVecLin
    (!![circleCoord 0, circleCoord 1; circleCoord 1, -circleCoord 0] - 1))

/-- The Möbius module `M` over `R = C(T, ℝ)` has `M ⊕ M ≅ R²`, and `M ⊕ Rᴺ ≇ Rᴺ⁺¹` for every
`N`: by the free stabilization criterion of 0.4, the reduced class `[M] − [R]` has order exactly
two in `K₀(R)`, and `M` is not free (Weibel, *The K-book*, Chapter I, (4.9.1), for the Möbius
bundle). -/
theorem mobiusSections_order_two :
    Nonempty ((mobiusSections × mobiusSections) ≃ₗ[C(AddCircle (1 : ℝ), ℝ)]
      (Fin 2 → C(AddCircle (1 : ℝ), ℝ))) ∧
    ∀ N : ℕ, IsEmpty ((mobiusSections × (Fin N → C(AddCircle (1 : ℝ), ℝ))) ≃ₗ[
      C(AddCircle (1 : ℝ), ℝ)] (Fin (N + 1) → C(AddCircle (1 : ℝ), ℝ))) := by
  sorry

/-! ## Layer A2: Algebraic K₁ and projective automorphisms -/

/-- `K₁(f) : K₁(R) → K₁(S)` for a ring homomorphism `f : R →+* S`, on Tau Ceti's
`TauCeti.AlgebraicK1`: the class of `u ∈ GLₙ(R)` goes to the class of the entrywise image `f(u)`,
which is well defined by `TauCeti.AlgebraicK1.lift` because entrywise application of `f` commutes
with the stabilizations `u ↦ u ⊕ 1` (Weibel, *The K-book*, Chapter III, the paragraph after
Definition 1.1). -/
noncomputable def kOneMap {R : Type u} {S : Type v} [Ring R] [Ring S] (f : R →+* S) :
    TauCeti.AlgebraicK1 R →* TauCeti.AlgebraicK1 S :=
  TauCeti.AlgebraicK1.lift
    (fun n => (TauCeti.AlgebraicK1.mk S n).comp
      (Units.map (f.mapMatrix : Matrix (Fin n) (Fin n) R →+* _).toMonoidHom))
    (fun m n h g => by
      have hmap : Units.map (f.mapMatrix : Matrix (Fin n) (Fin n) R →+* _).toMonoidHom
          (TauCeti.stabilizeGL R h g) = TauCeti.stabilizeGL S h
            (Units.map (f.mapMatrix : Matrix (Fin m) (Fin m) R →+* _).toMonoidHom g) := by
        ext i j
        rw [TauCeti.coe_stabilizeGL_apply]
        change f ((TauCeti.stabilizeGL R h g : Matrix (Fin n) (Fin n) R) i j) = _
        rw [TauCeti.coe_stabilizeGL_apply]
        split_ifs <;> simp [Matrix.one_apply, apply_ite f]
      simp only [MonoidHom.comp_apply, hmap, TauCeti.AlgebraicK1.mk_stabilizeGL])

/-- `K₁(D) ≅ Dˣ/[Dˣ,Dˣ]` for a division ring `D`, sending the class of the `1 × 1` matrix `(d)` to
the class of `d` (Weibel, *The K-book*, Chapter III, Example 1.3.5, chapter p. 4, from
Dieudonné's computation in 1.2.4 and Exercise 1.2). For a field this is `K₁(F) = Fˣ`. -/
theorem kOne_divisionRing (D : Type u) [DivisionRing D] :
    ∃ e : TauCeti.AlgebraicK1 D ≃* Abelianization Dˣ, ∀ d : Dˣ,
      e (TauCeti.AlgebraicK1.mk D 1
        (Units.map (Matrix.scalar (Fin 1) : D →+* Matrix (Fin 1) (Fin 1) D).toMonoidHom d)) =
        Abelianization.of d := by
  sorry

/-- `K₁(ℤ) ≅ ℤˣ = {±1}` by the determinant: the class of `g ∈ GLₙ(ℤ)` goes to `det g`
(Weibel, *The K-book*, Chapter III, Example 1.3.5, chapter p. 4, and Exercise 1.5). -/
theorem kOne_int :
    ∃ e : TauCeti.AlgebraicK1 ℤ ≃* ℤˣ, ∀ (n : ℕ) (g : GL (Fin n) ℤ),
      e (TauCeti.AlgebraicK1.mk ℤ n g) = Matrix.GeneralLinearGroup.det g := by
  sorry

/-- The Dieudonné determinant: for a division ring `D` and at least two indices there is a
surjective homomorphism `GLₙ(D) → Dˣ/[Dˣ,Dˣ]` with kernel `Eₙ(D)`, Tau Ceti's
`TauCeti.elementarySubgroup`, sending the diagonal matrix with one entry `d` and all others `1` to
the class of `d` (Weibel, *The K-book*, Chapter III, 1.2.4 and Exercise 1.2). -/
theorem dieudonne_determinant (D : Type u) [DivisionRing D]
    (n : Type v) [Fintype n] [DecidableEq n] (hn : 2 ≤ Fintype.card n) :
    ∃ φ : Matrix.GeneralLinearGroup n D →* Abelianization Dˣ,
      Function.Surjective φ ∧ φ.ker = TauCeti.elementarySubgroup n D ∧
      ∀ (g : Matrix.GeneralLinearGroup n D) (i : n) (d : Dˣ),
        (g : Matrix n n D) = Matrix.diagonal (Function.update (1 : n → D) i (d : D)) →
          φ g = Abelianization.of d := by
  sorry

/-! ## Layer A4: Stable range and finite matrix sizes -/

/-- Bass stable range at most `s`: every unimodular row `(a₀, …, aₛ)` of `Rˢ⁺¹` can be shortened
to a unimodular row `(aᵢ + aₛ cᵢ)ᵢ<ₛ`. Unimodular is Mathlib's `Module.IsUnimodular` for the left
module `Fin n → R`: some linear functional takes the value `1`, that is `∑ aᵢ bᵢ = 1` for some
`bᵢ`. -/
def HasStableRangeLE (R : Type u) [Ring R] (s : ℕ) : Prop :=
  ∀ a : Fin (s + 1) → R, Module.IsUnimodular R a →
    ∃ c : Fin s → R, Module.IsUnimodular R (fun i => a (Fin.castSucc i) + a (Fin.last s) * c i)

/-- Surjective stability (Bass): if `R` has stable range at most `s` and `n` has at least `s`
indices, every invertible matrix of size `n ⊕ k` is the block sum of an invertible matrix of
size `n` with an identity block, times an elementary matrix (Weibel, *The K-book*, Chapter III,
Exercise 1.3(a)). -/
theorem surjective_stability {R : Type u} [Ring R] (s : ℕ) (hR : HasStableRangeLE R s)
    (n k : Type v) [Fintype n] [DecidableEq n] [Fintype k] [DecidableEq k]
    (hn : s ≤ Fintype.card n) (g : Matrix.GeneralLinearGroup (n ⊕ k) R) :
    ∃ (h : Matrix.GeneralLinearGroup n R) (e : Matrix.GeneralLinearGroup (n ⊕ k) R),
      e ∈ TauCeti.elementarySubgroup (n ⊕ k) R ∧
        (g : Matrix (n ⊕ k) (n ⊕ k) R) = Matrix.fromBlocks (h : Matrix n n R) 0 0 1 *
          (e : Matrix (n ⊕ k) (n ⊕ k) R) := by
  sorry

/-- Injective stability (Vaserstein): if `R` has stable range at most `s` and `n` has at least
`s + 1` indices, an invertible matrix of size `n` whose block sum with an identity block is
elementary is itself elementary, so `GLₙ(R)/Eₙ(R) → K₁(R)` is injective (Weibel, *The K-book*,
Chapter III, Remark 1.2.5). -/
theorem injective_stability {R : Type u} [Ring R] (s : ℕ) (hR : HasStableRangeLE R s)
    (n k : Type v) [Fintype n] [DecidableEq n] [Fintype k] [DecidableEq k]
    (hn : s + 1 ≤ Fintype.card n) (g : Matrix.GeneralLinearGroup n R)
    (U : Matrix.GeneralLinearGroup (n ⊕ k) R)
    (hU : (U : Matrix (n ⊕ k) (n ⊕ k) R) = Matrix.fromBlocks (g : Matrix n n R) 0 0 1)
    (hUe : U ∈ TauCeti.elementarySubgroup (n ⊕ k) R) :
    g ∈ TauCeti.elementarySubgroup n R := by
  sorry

/-- Bass: a semilocal ring, one whose quotient by the Jacobson radical is semisimple, has stable
range one. The quotient is Artinian, hence of stable range one, and the stable range does not
change modulo the Jacobson radical (Weibel, *The K-book*, Chapter I, Exercises 1.5(c) and 1.12(v);
semilocal as in Chapter II, Exercise 2.6). -/
theorem hasStableRangeLE_one_of_isSemisimpleRing (R : Type u) [Ring R]
    [IsSemisimpleRing (R ⧸ Ring.jacobson R)] : HasStableRangeLE R 1 := by
  sorry

/-- Bass's bound: a commutative Noetherian ring of Krull dimension at most `d` has stable range
at most `d + 1` (Bass, *Algebraic K-Theory*, Benjamin 1968, Theorem V.3.5, as recalled in
Weibel, *The K-book*, Chapter I, Exercise 1.5(b)). -/
theorem hasStableRangeLE_of_ringKrullDim_le (A : Type u) [CommRing A] [IsNoetherianRing A]
    (d : ℕ) (h : ringKrullDim A ≤ d) : HasStableRangeLE A (d + 1) := by
  sorry

/-- Lebesgue covering dimension at most `d`: every open cover has an open refinement in which
each point lies in at most `d + 1` distinct members. -/
def HasCoveringDimensionLE (X : Type u) [TopologicalSpace X] (d : ℕ) : Prop :=
  ∀ 𝒰 : Set (Set X), (∀ U ∈ 𝒰, IsOpen U) → ⋃₀ 𝒰 = Set.univ →
    ∃ 𝒱 : Set (Set X), (∀ V ∈ 𝒱, IsOpen V) ∧ ⋃₀ 𝒱 = Set.univ ∧
      (∀ V ∈ 𝒱, ∃ U ∈ 𝒰, V ⊆ U) ∧
      ∀ x : X, {V | V ∈ 𝒱 ∧ x ∈ V}.encard ≤ ((d + 1 : ℕ) : ℕ∞)

/-- Vaserstein: for a compact Hausdorff space `X`, `C(X, ℂ)` has stable range at most `s ≥ 1`
exactly when `dim X ≤ 2s − 1`; equivalently its stable rank is `⌊dim X / 2⌋ + 1`, infinite when
`X` has no finite covering dimension (Vaserstein 1971, Theorem 7, with the identification of
Vaserstein's stable-value dimension with covering dimension for nonempty compact Hausdorff spaces,
which are normal: Vaserstein's remark on pp. 19–20 matches stable values with essential maps to a
cube, and Engelking, *Dimension Theory*, Problem 3.2.E, p. 238, characterizes the covering
dimension of a normal space by essential maps to balls; for empty `X` both sides hold, `C(∅, ℂ)`
being the zero ring). -/
theorem hasStableRangeLE_continuousMap_complex_iff (X : Type u) [TopologicalSpace X]
    [CompactSpace X] [T2Space X] (s : ℕ) (hs : 1 ≤ s) :
    HasStableRangeLE C(X, ℂ) s ↔ HasCoveringDimensionLE X (2 * s - 1) := by
  sorry

/-- Vaserstein: for a compact Hausdorff space `X`, `C(X, ℝ)` has stable range at most `s ≥ 1`
exactly when `dim X ≤ s − 1`; equivalently its stable rank is `dim X + 1`, infinite when `X` has
no finite covering dimension (Vaserstein 1971, Theorem 5, read for nonempty `X` through the same
identification of Vaserstein's `d(X)` with covering dimension, Engelking, *Dimension Theory*,
Problem 3.2.E; for empty `X` both sides hold). -/
theorem hasStableRangeLE_continuousMap_real_iff (X : Type u) [TopologicalSpace X]
    [CompactSpace X] [T2Space X] (s : ℕ) (hs : 1 ≤ s) :
    HasStableRangeLE C(X, ℝ) s ↔ HasCoveringDimensionLE X (s - 1) := by
  sorry

/-! ## Layer A5: Steinberg groups and K₂ -/

/-- The Steinberg relations on the generators `x_{ij}(a)`, for distinct natural numbers `i, j`
and `a ∈ R`: additivity `x_{ij}(a) x_{ij}(b) = x_{ij}(a + b)`; `[x_{ij}(a), x_{kl}(b)] = 1`
when `j ≠ k` and `i ≠ l`; and `[x_{ij}(a), x_{jk}(b)] = x_{ik}(ab)` for distinct `i, j, k`, the
order `ab` kept. Commutators are `[x, y] = x y x⁻¹ y⁻¹`. Weibel's third family
`[x_{ij}(a), x_{ki}(b)] = x_{kj}(−ba)` follows from the second by inversion (Weibel, *The K-book*,
Chapter III, Definition 5.1, chapter p. 35). -/
def steinbergRels (R : Type u) [Ring R] :
    Set (FreeGroup ({p : ℕ × ℕ // p.1 ≠ p.2} × R)) :=
  {r | (∃ (p : {p : ℕ × ℕ // p.1 ≠ p.2}) (a b : R),
          r = FreeGroup.of (p, a) * FreeGroup.of (p, b) * (FreeGroup.of (p, a + b))⁻¹) ∨
       (∃ (p q : {p : ℕ × ℕ // p.1 ≠ p.2}) (a b : R), p.1.2 ≠ q.1.1 ∧ p.1.1 ≠ q.1.2 ∧
          r = FreeGroup.of (p, a) * FreeGroup.of (q, b) * (FreeGroup.of (p, a))⁻¹ *
            (FreeGroup.of (q, b))⁻¹) ∨
       (∃ (i j k : ℕ) (hij : i ≠ j) (hjk : j ≠ k) (hik : i ≠ k) (a b : R),
          r = FreeGroup.of (⟨(i, j), hij⟩, a) * FreeGroup.of (⟨(j, k), hjk⟩, b) *
            (FreeGroup.of (⟨(i, j), hij⟩, a))⁻¹ * (FreeGroup.of (⟨(j, k), hjk⟩, b))⁻¹ *
            (FreeGroup.of (⟨(i, k), hik⟩, a * b))⁻¹)}

/-- The stable Steinberg group `St(R)`, presented on the generators `x_{ij}(a)` indexed by all
pairs of distinct natural numbers. It is the colimit of the groups `Stₙ(R)` of 5.1, whose
presentations are the restrictions of this one to indices below `n`. -/
abbrev SteinbergGroup (R : Type u) [Ring R] := PresentedGroup (steinbergRels R)

/-- The elementary matrix `e_{ij}(a) = 1 + a E_{ij}` as an element of `GL(R)`: Tau Ceti's
`TauCeti.transvectionUnit` at size `max i j + 1`, sent to the stable general linear group. The
stabilizations `u ↦ u ⊕ 1` keep the first indices, so every larger size gives the same element. -/
noncomputable def stableTransvection {R : Type u} [Ring R] (p : {p : ℕ × ℕ // p.1 ≠ p.2})
    (a : R) : TauCeti.StableGeneralLinearGroup R :=
  TauCeti.StableGeneralLinearGroup.of R (max p.1.1 p.1.2 + 1)
    (TauCeti.transvectionUnit (i := (⟨p.1.1, by omega⟩ : Fin (max p.1.1 p.1.2 + 1)))
      (j := ⟨p.1.2, by omega⟩) (fun h => p.2 (by simpa using congrArg Fin.val h)) a)

/-- **Kervaire–Steinberg.** The homomorphism `φ : St(R) → GL(R)` with `x_{ij}(a) ↦ e_{ij}(a)`,
unique since the `x_{ij}(a)` generate, has image `E(R)` and central kernel `K₂(R)`, and it is the
universal central extension of `E(R)`: for every group `E` and homomorphism `q : E → GL(R)` with
image `E(R)` and central kernel there is exactly one `ψ : St(R) → E` with `q ∘ ψ = φ` (Weibel,
*The K-book*, Chapter III, Theorem 5.2.1, Definition 5.3.1 and Theorem 5.5, chapter pp. 35–38;
uniqueness of `ψ` is Lemma 5.3.3, from the perfectness of `St(R)`). -/
theorem steinberg_universalCentralExtension (R : Type u) [Ring R] :
    ∃ φ : SteinbergGroup R →* TauCeti.StableGeneralLinearGroup R,
      (∀ p a, φ (PresentedGroup.of (p, a)) = stableTransvection p a) ∧
      φ.range = TauCeti.StableGeneralLinearGroup.elementarySubgroup R ∧
      φ.ker ≤ Subgroup.center (SteinbergGroup R) ∧
      ∀ (E : Type v) [Group E] (q : E →* TauCeti.StableGeneralLinearGroup R),
        q.range = TauCeti.StableGeneralLinearGroup.elementarySubgroup R →
        q.ker ≤ Subgroup.center E →
        ∃! ψ : SteinbergGroup R →* E, q.comp ψ = φ := by
  sorry

/-- **Steinberg.** `K₂(𝔽_q) = 0`: for a finite field `F` the homomorphism `St(F) → GL(F)` with
`x_{ij}(a) ↦ e_{ij}(a)` is injective (Weibel, *The K-book*, Chapter III, Corollary 6.1.1, chapter
p. 48). -/
theorem kTwo_finiteField (F : Type u) [Field F] [Finite F] :
    ∃ φ : SteinbergGroup F →* TauCeti.StableGeneralLinearGroup F,
      (∀ p a, φ (PresentedGroup.of (p, a)) = stableTransvection p a) ∧
      Function.Injective φ := by
  sorry

/-- The group of Matsumoto's presentation of a field `F`: the tensor square `Fˣ ⊗_ℤ Fˣ`, written
additively, modulo the subgroup generated by the `x ⊗ y` with `x + y = 1`, that is, by the
`x ⊗ (1 − x)` for `x ≠ 0, 1`. -/
abbrev MatsumotoGroup (F : Type u) [Field F] :=
  TensorProduct ℤ (Additive Fˣ) (Additive Fˣ) ⧸ Submodule.span ℤ
    {t | ∃ x y : Fˣ, (x : F) + y = 1 ∧
      t = TensorProduct.tmul ℤ (Additive.ofMul x) (Additive.ofMul y)}

/-- **Matsumoto.** For a field `F`, `K₂(F) = ker(St(F) → GL(F))` is isomorphic to
`MatsumotoGroup F` by an isomorphism sending the class of `r ⊗ s` to the Steinberg symbol
`{r, s} = [a, b]`, where `a` and `b` are any lifts to `St(F)` of `diag(r, r⁻¹, 1)` and
`diag(s, 1, s⁻¹)` (Weibel, *The K-book*, Chapter III, Definition 5.10, chapter p. 42, and
Matsumoto's Theorem 6.1, chapter p. 48). -/
theorem matsumoto (F : Type u) [Field F] :
    ∃ φ : SteinbergGroup F →* TauCeti.StableGeneralLinearGroup F,
      (∀ p a, φ (PresentedGroup.of (p, a)) = stableTransvection p a) ∧
      ∃ e : Additive φ.ker ≃+ MatsumotoGroup F, ∀ (r s : Fˣ) (a b : SteinbergGroup F),
        φ a = TauCeti.StableGeneralLinearGroup.of F 3
          (Units.map (Matrix.diagonalRingHom (Fin 3) F).toMonoidHom
            (MulEquiv.piUnits.symm ![r, r⁻¹, 1])) →
        φ b = TauCeti.StableGeneralLinearGroup.of F 3
          (Units.map (Matrix.diagonalRingHom (Fin 3) F).toMonoidHom
            (MulEquiv.piUnits.symm ![s, 1, s⁻¹])) →
        (((Additive.toMul (e.symm (Submodule.Quotient.mk
            (TensorProduct.tmul ℤ (Additive.ofMul r) (Additive.ofMul s))))) : φ.ker) :
              SteinbergGroup F) = a * b * a⁻¹ * b⁻¹ := by
  sorry

/-! ## Layer A6: Milnor patching and the boundary -/

/-- The category of patching triples of ring homomorphisms `π₁ : A₁ → Q` and `π₂ : A₂ → Q`:
Mathlib's categorical pullback of the two extension-of-scalars functors on finitely generated
projective right modules. Its objects are triples `(P₁, P₂, α)` with `Pⱼ` a finitely generated
projective right `Aⱼ`-module and `α : P₁ ⊗ Q ≅ P₂ ⊗ Q` a `Q`-linear isomorphism; its morphisms
are pairs of module maps compatible with the isomorphisms. -/
abbrev PatchingTriples {A₁ A₂ Q : Type u} [Ring A₁] [Ring A₂] [Ring Q]
    (π₁ : A₁ →+* Q) (π₂ : A₂ →+* Q) :=
  Limits.CategoricalPullback (RingHom.op π₁).finiteProjectiveModulesExtendScalars
    (RingHom.op π₂).finiteProjectiveModulesExtendScalars

/-- The patching functor of the square of `π₁ : A₁ → Q` and `π₂ : A₂ → Q`, with `D = A₁ ×_Q A₂`
Mathlib's `RingHom.pullback` and `p₁, p₂` its projections: it sends a finitely generated
projective right `D`-module `P` to the triple `(P ⊗_D A₁, P ⊗_D A₂, α_P)`, where
`α_P : (P ⊗_D A₁) ⊗ Q ≅ (P ⊗_D A₂) ⊗ Q` is the component of `extendScalarsCompIso` for the
square `π₁ ∘ p₁ = π₂ ∘ p₂`, the canonical isomorphism through `P ⊗_D Q`. -/
noncomputable def patchingFunctor {A₁ A₂ Q : Type u} [Ring A₁] [Ring A₂] [Ring Q]
    (π₁ : A₁ →+* Q) (π₂ : A₂ →+* Q) :
    FiniteProjectiveRight (π₁.pullback π₂) ⥤ PatchingTriples π₁ π₂ :=
  (Limits.CategoricalPullback.CatCommSqOver.toFunctorToCategoricalPullback _ _ _).obj
    { fst := (RingHom.op (π₁.pullbackFst π₂)).finiteProjectiveModulesExtendScalars
      snd := (RingHom.op (π₁.pullbackSnd π₂)).finiteProjectiveModulesExtendScalars
      iso := extendScalarsCompIso _ _ _ _
        (congrArg RingHom.op (RingHom.pullback_comm_sq π₁ π₂)) }

/-- **Milnor patching**: for unital maps `π₁ : A₁ → Q` and `π₂ : A₂ → Q` one of which is
surjective, the patching functor from finitely generated projective right modules over
`D = A₁ ×_Q A₂` to patching triples is an equivalence of categories (Weibel, *The K-book*,
Chapter I, Milnor Patching Theorem 2.7, chapter p. 12; for commutative rings in this categorical
form, Stacks Project, Tag 0D2J). Without a surjective leg it fails: for `ℤ → ℚ ← ℤ` the triple
`(ℤ, ℤ, 2)` is not isomorphic to the image `(ℤ, ℤ, 1)` of `D = ℤ`. -/
theorem milnor_patching {A₁ A₂ Q : Type u} [Ring A₁] [Ring A₂] [Ring Q]
    (π₁ : A₁ →+* Q) (π₂ : A₂ →+* Q)
    (h : Function.Surjective π₁ ∨ Function.Surjective π₂) :
    (patchingFunctor π₁ π₂).IsEquivalence := by
  sorry

/-- The `K₀` end of the Mayer–Vietoris sequence of a Milnor square: for unital maps
`π₁ : A₁ → Q`, `π₂ : A₂ → Q` one of which is surjective, with `D = A₁ ×_Q A₂` Mathlib's
`RingHom.pullback` and `p₁, p₂` its projections, the sequence
`K₀(D) → K₀(A₁) ⊕ K₀(A₂) → K₀(Q)`, with `f₀ = (K₀(p₁), K₀(p₂))` and
`g₀(x, y) = K₀(π₁)x − K₀(π₂)y`, is exact at `K₀(A₁) ⊕ K₀(A₂)` (Weibel, *The K-book*,
Chapter III, Theorem 2.6, chapter p. 15). Neither injectivity of `f₀` nor surjectivity of `g₀`
is claimed. -/
theorem kZero_mayerVietoris_exact {A₁ A₂ Q : Type u} [Ring A₁] [Ring A₂] [Ring Q]
    (π₁ : A₁ →+* Q) (π₂ : A₂ →+* Q)
    (h : Function.Surjective π₁ ∨ Function.Surjective π₂) :
    Function.Exact
      ((kZeroMap (RingHom.pullbackFst π₁ π₂)).prod (kZeroMap (RingHom.pullbackSnd π₁ π₂)))
      ((kZeroMap π₁).comp (AddMonoidHom.fst (KZero A₁) (KZero A₂)) -
        (kZeroMap π₂).comp (AddMonoidHom.snd (KZero A₁) (KZero A₂))) := by
  sorry

/-- The `K₁` exactness of the Mayer–Vietoris sequence of a Milnor square at `K₁(A₁) ⊕ K₁(A₂)`:
for unital maps `π₁ : A₁ → Q`, `π₂ : A₂ → Q` one of which is surjective, with `D = A₁ ×_Q A₂`
Mathlib's `RingHom.pullback` and `p₁, p₂` its projections, a pair `(x, y)` of classes with
`K₁(π₁)x = K₁(π₂)y` in `K₁(Q)` is `(K₁(p₁)z, K₁(p₂)z)` for some `z ∈ K₁(D)`. The groups are Tau
Ceti's multiplicative `TauCeti.AlgebraicK1`, so the map `g₁(x, y) = K₁(π₁)x − K₁(π₂)y` is a
quotient (Weibel, *The K-book*, Chapter III, Theorem 2.6, chapter p. 15). Injectivity of
`f₁ = (K₁(p₁), K₁(p₂))` is not claimed. -/
theorem kOne_mayerVietoris_exact {A₁ : Type u} {A₂ : Type v} {Q : Type w} [Ring A₁] [Ring A₂]
    [Ring Q] (π₁ : A₁ →+* Q) (π₂ : A₂ →+* Q)
    (h : Function.Surjective π₁ ∨ Function.Surjective π₂) :
    ((kOneMap π₁).comp (MonoidHom.fst _ _) / (kOneMap π₂).comp (MonoidHom.snd _ _)).ker =
      ((kOneMap (RingHom.pullbackFst π₁ π₂)).prod
        (kOneMap (RingHom.pullbackSnd π₁ π₂))).range := by
  sorry

/-! ## Layer A7: Gluing examples and calculations -/

/-- The ring `ℤ ×_{𝔽₅} ℤ = {(a, b) | a ≡ b mod 5}` of the arithmetic Milnor square, Mathlib's
pullback of two copies of the reduction `ℤ → 𝔽₅`. -/
abbrev arithmeticSquare := (Int.castRingHom (ZMod 5)).pullback (Int.castRingHom (ZMod 5))

/-- `K₀(ℤ ×_{𝔽₅} ℤ) ≅ ℤ ⊕ ℤ/2`, with the class of the free module of rank one going to `(1, 0)`,
and the kernel of `f₀ = (K₀(p₁), K₀(p₂)) : K₀(ℤ ×_{𝔽₅} ℤ) → K₀(ℤ) ⊕ K₀(ℤ)` the preimage of
`0 ⊕ ℤ/2`, so `ker f₀ ≅ ℤ/2`: in the Mayer–Vietoris sequence of the arithmetic square the image
of `f₀` is the diagonal and its kernel is `𝔽₅ˣ/{±1}`, the cokernel of `K₁(ℤ) ⊕ K₁(ℤ) → K₁(𝔽₅)`
(Weibel, *The K-book*, Chapter III, Theorem 2.6, chapter p. 15). -/
theorem kZero_arithmeticSquare :
    ∃ e : KZero arithmeticSquare ≃+ ℤ × ZMod 2,
      e (TauCeti.SplitK0.of
        (⟨ModuleCat.of arithmeticSquareᵐᵒᵖ arithmeticSquareᵐᵒᵖ,
          TauCeti.finiteProjectiveModules_iff.mpr
            ⟨Module.Finite.self _, @Module.Projective.of_free _ _ _ _ _ (Module.Free.self _)⟩⟩ :
          FiniteProjectiveRight arithmeticSquare)) = (1, 0) ∧
      ∀ x : KZero arithmeticSquare,
        ((kZeroMap (R := arithmeticSquare) (RingHom.pullbackFst _ _)).prod
          (kZeroMap (R := arithmeticSquare) (RingHom.pullbackSnd _ _))) x = 0 ↔ (e x).1 = 0 := by
  sorry

/-- The cusp `𝔽₅[t², t³]`, Mathlib's pullback of the reduction `𝔽₅[t] → 𝔽₅[t]/(t²)` and the
constants `𝔽₅ → 𝔽₅[t]/(t²)`; only the first leg is surjective. -/
noncomputable abbrev cuspSquare :=
  (Ideal.Quotient.mk (Ideal.span {(Polynomial.X : Polynomial (ZMod 5)) ^ 2})).pullback
    ((Ideal.Quotient.mk (Ideal.span {(Polynomial.X : Polynomial (ZMod 5)) ^ 2})).comp
      (algebraMap (ZMod 5) (Polynomial (ZMod 5))))

/-- `K₀(𝔽₅[t², t³]) ≅ ℤ ⊕ 𝔽₅`, with the class of the free module of rank one going to `(1, 0)`,
and the kernel of `f₀ = (K₀(p₁), K₀(p₂)) : K₀(𝔽₅[t², t³]) → K₀(𝔽₅[t]) ⊕ K₀(𝔽₅)` the preimage of
`0 ⊕ 𝔽₅`, so `ker f₀ ≅ ℤ/5`, the cokernel `1 + t𝔽₅` of `K₁(𝔽₅[t]) ⊕ K₁(𝔽₅) → K₁(𝔽₅[t]/(t²))`
(Weibel, *The K-book*, Chapter II, Example 2.9.1, chapter p. 13, for the cusp over a field `k`,
where `K₀ ≅ ℤ ⊕ k`, and Chapter III, Theorem 2.6, chapter p. 15). -/
theorem kZero_cuspSquare :
    ∃ e : KZero cuspSquare ≃+ ℤ × ZMod 5,
      e (TauCeti.SplitK0.of
        (⟨ModuleCat.of cuspSquareᵐᵒᵖ cuspSquareᵐᵒᵖ,
          TauCeti.finiteProjectiveModules_iff.mpr
            ⟨Module.Finite.self _, @Module.Projective.of_free _ _ _ _ _ (Module.Free.self _)⟩⟩ :
          FiniteProjectiveRight cuspSquare)) = (1, 0) ∧
      ∀ x : KZero cuspSquare,
        ((kZeroMap (R := cuspSquare) (RingHom.pullbackFst _ _)).prod
          (kZeroMap (R := cuspSquare) (RingHom.pullbackSnd _ _))) x = 0 ↔ (e x).1 = 0 := by
  sorry

end TauCetiRoadmap.AlgebraicKTheory
