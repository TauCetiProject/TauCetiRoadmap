module

public import Mathlib
public import TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic
public import TauCeti.Algebra.Category.ModuleCat.FiniteProjective.ScalarChange
public import TauCeti.CategoryTheory.GrothendieckGroup.Split

/-!
# Algebraic K-theory in low degrees: target signatures

The roadmap is `README.md`; this file is not the roadmap and is not exhaustive. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`,
together with the few definitions with real bodies that they need.

The matrix headlines (Whitehead's lemma, the Dieudonné determinant and Bass–Vaserstein
stability) are stated at finite matrix size, which is the form in which they are proved; the
stable group `GL(R)` and `K₁(R)` are README targets.

Headline theorems of the roadmap that are not statable at the pins:

* The Milnor patching theorem and the full Milnor exact sequence of A6: the patching theorem
  needs the category of patching triples, and the `K₁` terms and the boundary need the stable
  group `GL(R)` and `K₁(R)`, README targets that neither library has. The `K₀` end of the
  sequence is stated below, with the `K₀` map of a ring homomorphism `kZeroMap`, which is
  `TauCeti.SplitK0.map` of the pinned extension-of-scalars functor on finitely generated
  projective modules.
* The torsion class `[M(2)] − [D]` of 7.2: the patched module `M(2)` is a finitely generated
  projective module only by the patching theorem, so its class cannot be written without a
  sorry'd proof inside the term. The kernels `ker f₀ ≅ ℤ/2` and `ker f₀ ≅ ℤ/5` of 7.2, which
  mention only `kZeroMap`, are stated below inside the two values of `K₀`: the kernel of `f₀` is
  the preimage of the torsion factor under the stated decomposition.
* The identification of the patched modules of 7.1 with glued bundles: this needs the section
  modules of continuous bundles, which neither library has.
* The real tangent-section module's nonfreeness, stable splitting and K₀ class (0.5)
  require the continuous section submodule cut out by the sphere projection, with its
  finite-projective object in `FiniteProjectiveRight`.
* The free rank-two complexified sphere module and its scalar-extension comparison (0.6)
  require that section module over `C(S², ℂ)`; the extension of scalars itself is the pinned
  `TauCeti.BalancedExtension`. The Chern number comparison additionally requires the oriented
  tangent complex line and its first Chern class.
* The real Möbius module's nonfreeness and order-two reduced K₀ class, and its free complex
  scalar extension (0.7), require the antiperiodic section module over `C(AddCircle 1, 𝕜)`,
  its descended scalar action and finite-projective object.
* The relative exact sequences of A3 and the boundary map of A6: these need A3's relative
  triple group and A2's automorphism presentation of `K₁`, which neither library has.
* The universal central extension `St(R) → E(R)`, Matsumoto's presentation of `K₂` of a field
  and `K₂(𝔽_q) = 0` (A5): neither library has the Steinberg group.
* The surjection of algebraic `K₁` of a Banach algebra `A` onto its stable component group, the
  colimit of `GLₙ(A)/GLₙ(A)₀`, and its kernel (A8): both groups are stable colimits over `GL(A)`,
  a README target, and neither library has the stable component group.
-/

@[expose] public section

namespace TauCetiRoadmap.AlgebraicKTheory

open Matrix

universe u v

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

/-! ## Layer A1: Stable matrices, elementary operations and Whitehead's lemma -/

/-- The elementary subgroup `Eₙ(R)` of the invertible matrices over an arbitrary ring,
generated by the matrices `1 + a Eᵢⱼ` with `i ≠ j`. -/
def elementary {R : Type u} [Ring R] (n : Type v) [Fintype n] [DecidableEq n] :
    Subgroup (Matrix.GeneralLinearGroup n R) :=
  Subgroup.closure {g | ∃ (i j : n) (_ : i ≠ j) (a : R),
    (g : Matrix n n R) = 1 + Matrix.single i j a}

/-- Whitehead's lemma, first half: the block sum of a commutator `ghg⁻¹h⁻¹` in `GLₙ(R)` with an
identity block of the same size is a product of elementary matrices (Weibel, *The K-book*,
Chapter III, Whitehead's Lemma 1.3.3 and the factorization (1.3.4)). -/
theorem whitehead_commutator_elementary {R : Type u} [Ring R]
    (n : Type v) [Fintype n] [DecidableEq n] (g h : Matrix.GeneralLinearGroup n R) :
    ∃ U : Matrix.GeneralLinearGroup (n ⊕ n) R,
      (U : Matrix (n ⊕ n) (n ⊕ n) R) =
        Matrix.fromBlocks
          ((g * h * g⁻¹ * h⁻¹ : Matrix.GeneralLinearGroup n R) : Matrix n n R) 0 0 1 ∧
      U ∈ elementary (R := R) (n ⊕ n) := by
  sorry

/-- Whitehead's lemma, second half: with at least three indices every elementary matrix is a
commutator, so `Eₙ(R)` is perfect and lies in the commutator subgroup of `GLₙ(R)` (Weibel,
*The K-book*, Chapter III, Lemma 1.3.2). -/
theorem elementary_le_commutator {R : Type u} [Ring R]
    (n : Type v) [Fintype n] [DecidableEq n] (hn : 3 ≤ Fintype.card n) :
    elementary (R := R) n ≤ commutator (Matrix.GeneralLinearGroup n R) := by
  sorry

/-! ## Layer A2: Algebraic K₁ and projective automorphisms -/

/-- The Dieudonné determinant: for a division ring `D` and at least two indices there is a
surjective homomorphism `GLₙ(D) → Dˣ/[Dˣ,Dˣ]` with kernel `Eₙ(D)`, sending the diagonal matrix
with one entry `d` and all others `1` to the class of `d` (Weibel, *The K-book*, Chapter III,
1.2.4 and Exercise 1.2). -/
theorem dieudonne_determinant (D : Type u) [DivisionRing D]
    (n : Type v) [Fintype n] [DecidableEq n] (hn : 2 ≤ Fintype.card n) :
    ∃ φ : Matrix.GeneralLinearGroup n D →* Abelianization Dˣ,
      Function.Surjective φ ∧ φ.ker = elementary (R := D) n ∧
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
      e ∈ elementary (R := R) (n ⊕ k) ∧
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
    (hUe : U ∈ elementary (R := R) (n ⊕ k)) :
    g ∈ elementary (R := R) n := by
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
Vaserstein's stable-value dimension with covering dimension for nonempty compact Hausdorff spaces;
for empty `X` both sides hold, `C(∅, ℂ)` being the zero ring). -/
theorem hasStableRangeLE_continuousMap_complex_iff (X : Type u) [TopologicalSpace X]
    [CompactSpace X] [T2Space X] (s : ℕ) (hs : 1 ≤ s) :
    HasStableRangeLE C(X, ℂ) s ↔ HasCoveringDimensionLE X (2 * s - 1) := by
  sorry

/-- Vaserstein: for a compact Hausdorff space `X`, `C(X, ℝ)` has stable range at most `s ≥ 1`
exactly when `dim X ≤ s − 1`; equivalently its stable rank is `dim X + 1`, infinite when `X` has
no finite covering dimension (Vaserstein 1971, Theorem 5, read for nonempty `X`; for empty `X`
both sides hold). -/
theorem hasStableRangeLE_continuousMap_real_iff (X : Type u) [TopologicalSpace X]
    [CompactSpace X] [T2Space X] (s : ℕ) (hs : 1 ≤ s) :
    HasStableRangeLE C(X, ℝ) s ↔ HasCoveringDimensionLE X (s - 1) := by
  sorry

/-! ## Layer A6: Milnor patching and the boundary -/

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
