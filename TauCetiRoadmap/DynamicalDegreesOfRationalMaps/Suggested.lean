module

import Mathlib
import TauCeti.AlgebraicGeometry.Cohomology.EulerCharacteristic
import TauCeti.AlgebraicGeometry.IntersectionNumber.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Functoriality
import TauCeti.AlgebraicGeometry.Morphisms.Dominant
import TauCeti.AlgebraicGeometry.ProjectiveSpectrum.ProjectiveOver

/-!
# Dynamical degrees of rational maps: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with the few definitions
they need: the graph of a rational map and its projections, the topological degree, the
numerical intersection numbers of line-bundle classes and of real classes, nefness, the mixed
degrees of a rational map, iterates, the dynamical degrees and the algebraic entropy.

Conventions of the statements. `K` is a field and a projective variety over `K` is a scheme `X`
with `[X.Over (Spec (.of K))] [IsIntegral X] [X.IsProjectiveOver K]` (Tau Ceti's
`AlgebraicGeometry.Scheme.IsProjectiveOver`), of dimension `d` in the sense of
`topologicalKrullDim X = d`. A real class on `X` is a finite formal real combination of
line-bundle classes, an element of `LineBundleClass X →₀ ℝ`; its image in `Pic(X) ⊗ ℝ` is
the class, and every number below depends only on that image (README §2.3). A real polarization
is a real class `ω` with `IsNef K ω` and `0 < realIntersection K X (fun _ : Fin d ↦ ω)`.

The base change `f_{K'}` of a rational self-map along a field extension `K'/K` (README §1.4) is
not defined here: it enters the statements through its characterization (README §1.4) as the
unique `K'`-rational self-map `f'` of `X' = X ×_K Spec K'` with `π ∘ f' = f ∘ π` for the
projection `π : X' → X`, written `f'.compHom π = π.toRationalMap.comp f`.

Headline theorems that are not statable at the pins, and what each lacks: the formulas on
projective space (README §§6.1–6.4), namely `deg_{1,H}(f) = a` for a map given by forms of degree
`a` without common factor, the degrees and dynamical degrees of the standard Cremona involution,
`λ_1 = Real.goldenRatio` for the Fibonacci map, and the extension of polynomial self-maps of
affine space. They lack the rational self-map `[F_0 : ⋯ : F_d]` of `ℙ^d_K` attached to forms.
README §6.1 constructs it by gluing the morphisms that Mathlib's
`AlgebraicGeometry.Proj.fromOfGlobalSections` gives on the affine charts `D_+(F_i)`. Neither
library has the glued map, nor the chart morphisms `y_j ↦ F_j/F_i` into the degree-zero
localizations; pinning the map down through them would be a long ad hoc encoding.

Invariance of the dynamical degrees under the normalization lift (README §5.3) is the case of
`dynamicalDegree_birational_conj` in which the partial isomorphism is the inverse of the
normalization over the normal locus. The equality of the degrees themselves under the lift
(README §4.3) is not a case of that theorem, which compares only the limits `λ_k`: it is an
instance of model independence (README §4.1), a README target.
-/

namespace TauCetiRoadmap.DynamicalDegreesOfRationalMaps

open CategoryTheory Limits AlgebraicGeometry Filter Topology
open TauCeti.AlgebraicGeometry (LineBundleClass)

universe u

noncomputable section

/-! ## Layer 1: Function fields and the graph of a dominant rational map -/

/-- The graph `Γ_f` of a rational map `f : X ⤏ Y` (README §1.2): the scheme-theoretic image of
`(ι_V, g) : V → X × Y` for a representative `(V, g)` of `f`. For a reduced `X` the image does not
depend on the representative and, for a `K`-rational map between `K`-schemes, lies in the closed
subscheme `X ×_K Y` of `X × Y`; for a nonreduced `X` both can fail (README §1.2, Checks). -/
def graph {X Y : Scheme.{u}} (f : X ⤏ Y) : Scheme.{u} :=
  (prod.lift f.representative.domain.ι f.representative.hom).image

/-- The first projection `π_1 : Γ_f → X` of the graph (README §1.2). -/
def graphFst {X Y : Scheme.{u}} (f : X ⤏ Y) : graph f ⟶ X :=
  (prod.lift f.representative.domain.ι f.representative.hom).imageι ≫ prod.fst

/-- The second projection `π_2 : Γ_f → Y` of the graph (README §1.2). -/
def graphSnd {X Y : Scheme.{u}} (f : X ⤏ Y) : graph f ⟶ Y :=
  (prod.lift f.representative.domain.ι f.representative.hom).imageι ≫ prod.snd

/-- The topological degree `e(f) = [K(X) : f^*K(Y)]` of a dominant rational map between
integral schemes (README §1.1), computed on a representative `g : V → Y`, whose source has
function field `K(X)`: the dimension of `K(V)` over the image of Tau Ceti's pullback of
rational functions `Scheme.Hom.functionFieldMap`. It counts inseparable degree and is `0` when
the extension is infinite. -/
def topologicalDegree {X Y : Scheme.{u}} [IsIntegral X] [IsIntegral Y] (f : X ⤏ Y)
    [f.IsDominant] : ℕ :=
  haveI : Nonempty f.representative.domain :=
    f.representative.dense_domain.nonempty.to_subtype
  Module.finrank f.representative.hom.functionFieldMap.hom.fieldRange
    f.representative.domain.toScheme.functionField

/-- **The graph** (README §1.2). For a `K`-rational map `f : X ⤏ Y` between projective varieties
over `K`, the graph is integral and has the dimension of `X`; the first projection is proper and
is an isomorphism over the domain of definition of `f`; and if `f` is dominant, the second
projection is surjective. -/
theorem graph_isIntegral_and_projections (K : Type u) [Field K] {X Y : Scheme.{u}}
    [X.Over (Spec (.of K))] [Y.Over (Spec (.of K))] [IsIntegral X] [IsIntegral Y]
    [X.IsProjectiveOver K] [Y.IsProjectiveOver K] (f : X ⤏ Y) [f.IsOver (Spec (.of K))] :
    IsIntegral (graph f) ∧ topologicalKrullDim (graph f) = topologicalKrullDim X ∧
      IsProper (graphFst f) ∧ IsIso (graphFst f ∣_ f.domain) ∧
      (f.IsDominant → Function.Surjective (graphSnd f)) := by
  sorry

/-! ## Layer 2: Intersection numbers over a field -/

/-- The numerical intersection number `(L_1 ⋯ L_r)_X` of `r` line-bundle classes on a scheme
over `K` (README, Conventions and Layer 2), written as the mixed difference
`Σ_{S ⊆ {1, …, r}} (−1)^{r − |S|} χ_K(X, Σ_{i ∈ S} L_i)` with
`χ_K = Σ_{i ≤ r} (−1)^i dim_K H^i` (Tau Ceti's `Scheme.Modules.eulerCharBelow` truncated at
`r + 1`). For `X` proper over `K` of dimension at most `r`, cohomology vanishes above degree `r`
and `n ↦ χ(X, Σ n_i L_i)` is a polynomial of total degree at most `r`, so this is its
coefficient of `n_1 ⋯ n_r` (Stacks, Varieties, Lemma 45.1 and Definition 45.3). -/
def numericalIntersection (K : Type u) [Field K] (X : Scheme.{u}) [X.Over (Spec (.of K))]
    {r : ℕ} (a : Fin r → LineBundleClass X) : ℤ :=
  ∑ s : Finset (Fin r), (-1) ^ (r - s.card) *
    LineBundleClass.lift (fun L ↦ Scheme.Modules.eulerCharBelow K X L.obj (r + 1))
      (fun _ _ ⟨e⟩ ↦ Scheme.Modules.eulerCharBelow_congr K e (r + 1)) (∏ i ∈ s, a i)

/-- The intersection number `(ω_1 ⋯ ω_r)_X` of `r` real classes (README §2.3), each a finite
formal real combination of line-bundle classes: the multilinear expansion
`Σ_{a_1, …, a_r} (Π_j ω_j(a_j)) · (a_1 ⋯ a_r)_X` over the supports. -/
def realIntersection (K : Type u) [Field K] (X : Scheme.{u}) [X.Over (Spec (.of K))]
    {r : ℕ} (ω : Fin r → LineBundleClass X →₀ ℝ) : ℝ :=
  ∑ a ∈ Fintype.piFinset fun j ↦ (ω j).support,
    (∏ j, ω j (a j)) * (numericalIntersection K X a : ℝ)

/-- A real class `ω = Σ t_a a` on a scheme `X` over `K` is **nef** (README §2.3) if
`Σ t_a (a · C) ≥ 0` for every integral closed curve `C ⊆ X`, proper over `K`, where `(a · C)` is
Tau Ceti's degree `LineBundleClass.intersectionNumber` of the restriction of `a` to `C`. For a
single line bundle on a proper `X` this is the nefness of AlgebraicModuliForArithmeticGeometryPartII
§1.5. -/
def IsNef (K : Type u) [Field K] {X : Scheme.{u}} [X.Over (Spec (.of K))]
    (ω : LineBundleClass X →₀ ℝ) : Prop :=
  ∀ (C : Scheme.{u}) [C.Over (Spec (.of K))] [IsIntegral C] [IsProper (C ↘ Spec (.of K))]
    (ι : C ⟶ X) [IsClosedImmersion ι] [ι.IsOver (Spec (.of K))],
    topologicalKrullDim C = 1 →
      0 ≤ ω.sum fun a t ↦ t * (LineBundleClass.intersectionNumber K ι a : ℝ)

/-! ## Layer 3: Positivity over an arbitrary field -/

/-- **The Khovanskii–Teissier inequality** over an arbitrary field (README §3.5). On an integral
projective variety `V` of dimension `m + 2` over `K`, for nef real classes `A, B` and
`C_1, …, C_m`,
`(A² · C_1 ⋯ C_m)·(B² · C_1 ⋯ C_m) ≤ (A · B · C_1 ⋯ C_m)²`.
Cutkosky, Teissier's problem on inequalities of nef divisors over an arbitrary field,
Theorem 6.1; Lazarsfeld, Positivity I, Theorem 1.6.1. -/
theorem khovanskii_teissier (K : Type u) [Field K] {V : Scheme.{u}} [V.Over (Spec (.of K))]
    [IsIntegral V] [V.IsProjectiveOver K] {m : ℕ} (hV : topologicalKrullDim V = (m + 2 : ℕ))
    (A B : LineBundleClass V →₀ ℝ) (C : Fin m → LineBundleClass V →₀ ℝ)
    (hA : IsNef K A) (hB : IsNef K B) (hC : ∀ j, IsNef K (C j)) :
    realIntersection K V (Fin.cons A (Fin.cons A C)) *
        realIntersection K V (Fin.cons B (Fin.cons B C)) ≤
      realIntersection K V (Fin.cons A (Fin.cons B C)) ^ 2 := by
  sorry

/-- **Siu's inequality for products** over an arbitrary field (README §3.6). On an integral
projective variety `V` of dimension `i + j` over `K`, for nef real classes `A_1, …, A_i`, `B`
and `C_1, …, C_j`,
`(B^{i+j})·(A_1 ⋯ A_i · C_1 ⋯ C_j) ≤ (j + 1)^i·(A_1 ⋯ A_i · B^j)·(B^i · C_1 ⋯ C_j)`.
Dang, Degrees of iterates of rational maps on normal projective varieties, Theorem 3.4.4. -/
theorem siu_inequality_products (K : Type u) [Field K] {V : Scheme.{u}}
    [V.Over (Spec (.of K))] [IsIntegral V] [V.IsProjectiveOver K] {i j : ℕ}
    (hV : topologicalKrullDim V = (i + j : ℕ)) (A : Fin i → LineBundleClass V →₀ ℝ)
    (B : LineBundleClass V →₀ ℝ) (C : Fin j → LineBundleClass V →₀ ℝ)
    (hA : ∀ l, IsNef K (A l)) (hB : IsNef K B) (hC : ∀ l, IsNef K (C l)) :
    realIntersection K V (fun _ : Fin (i + j) ↦ B) * realIntersection K V (Fin.append A C) ≤
      ((j + 1 : ℕ) : ℝ) ^ i * realIntersection K V (Fin.append A fun _ : Fin j ↦ B) *
        realIntersection K V (Fin.append (fun _ : Fin i ↦ B) C) := by
  sorry

/-! ## Layer 4: Degrees of dominant rational maps -/

/-- The mixed degree `deg(f; ω^p | η^q) = (π_1^*ω^p · π_2^*η^q)_{Γ_f}` of a rational map
`f : X ⤏ Y` (README §4.1), the real intersection number on the graph, regarded as a `K`-scheme
through `π_1`, of `p` copies of the pullback of the real class `ω` on `X` and `q` copies of the
pullback of the real class `η` on `Y`. For `dim X = dim Y = d` the degree `deg_k(f; L, M)` of the
README is `mixedDegree K f L M (d - k) k`. -/
def mixedDegree (K : Type u) [Field K] {X Y : Scheme.{u}} [X.Over (Spec (.of K))]
    (f : X ⤏ Y) (ω : LineBundleClass X →₀ ℝ) (η : LineBundleClass Y →₀ ℝ) (p q : ℕ) : ℝ :=
  letI : (graph f).Over (Spec (.of K)) := ⟨graphFst f ≫ X ↘ Spec (.of K)⟩
  realIntersection K (graph f)
    (Fin.append (fun _ : Fin p ↦ ω.mapDomain (LineBundleClass.pullback (graphFst f)))
      (fun _ : Fin q ↦ η.mapDomain (LineBundleClass.pullback (graphSnd f))))

/-- **Positivity of the degrees** (README §4.2). For a dominant `K`-rational map between
projective varieties of dimension `d` and real polarizations `L` on `X` and `M` on `Y`, every
mixed degree `deg(f; L^p | M^q)` with `p + q = d` is positive. -/
theorem mixedDegree_pos (K : Type u) [Field K] {X Y : Scheme.{u}}
    [X.Over (Spec (.of K))] [Y.Over (Spec (.of K))] [IsIntegral X] [IsIntegral Y]
    [X.IsProjectiveOver K] [Y.IsProjectiveOver K] {d : ℕ} (hX : topologicalKrullDim X = d)
    (hY : topologicalKrullDim Y = d) (f : X ⤏ Y) [f.IsDominant] [f.IsOver (Spec (.of K))]
    (L : LineBundleClass X →₀ ℝ) (M : LineBundleClass Y →₀ ℝ) (hL : IsNef K L)
    (hLd : 0 < realIntersection K X fun _ : Fin d ↦ L) (hM : IsNef K M)
    (hMd : 0 < realIntersection K Y fun _ : Fin d ↦ M) (p q : ℕ) (hpq : p + q = d) :
    0 < mixedDegree K f L M p q := by
  sorry

/-- **The boundary values of the degrees** (README §4.2). For a dominant `K`-rational map
between projective varieties of dimension `d` and real classes `L` on `X` and `M` on `Y`,
`deg_0(f; L, M) = (L^d)_X` and `deg_d(f; L, M) = e(f)·(M^d)_Y`. -/
theorem mixedDegree_boundary (K : Type u) [Field K] {X Y : Scheme.{u}}
    [X.Over (Spec (.of K))] [Y.Over (Spec (.of K))] [IsIntegral X] [IsIntegral Y]
    [X.IsProjectiveOver K] [Y.IsProjectiveOver K] {d : ℕ} (hX : topologicalKrullDim X = d)
    (hY : topologicalKrullDim Y = d) (f : X ⤏ Y) [f.IsDominant] [f.IsOver (Spec (.of K))]
    (L : LineBundleClass X →₀ ℝ) (M : LineBundleClass Y →₀ ℝ) :
    mixedDegree K f L M d 0 = realIntersection K X (fun _ : Fin d ↦ L) ∧
      mixedDegree K f L M 0 d =
        (topologicalDegree f : ℝ) * realIntersection K Y (fun _ : Fin d ↦ M) := by
  sorry

/-- **The degrees over an extension of the field** (README §4.3). For a dominant `K`-rational map
`f : X ⤏ Y` between projective varieties of dimension `d`, real classes `L` on `X` and `M` on `Y`,
`p + q = d` and every field extension `K'/K`, the mixed degree `deg(f; L^p | M^q)` over `K` is the
intersection number over `K'`, on the base change `(Γ_f)_{K'} = Γ_f ×_K Spec K'` of the graph, of
`p` copies of the pullback of `L` and `q` copies of the pullback of `M`. The graph is a `K`-scheme
through `π_1` (the instance binders: a structure morphism for which `π_1` is a `K`-morphism, so
`Γ_f → Spec K` is `π_1` followed by `X → Spec K`), and the fibre product is a `K'`-scheme through
its second projection (Mathlib's `AlgebraicGeometry.Scheme.canonicallyOverPullback`). No
geometric integrality is assumed: `(Γ_f)_{K'}` may be reducible. -/
theorem mixedDegree_baseChange (K K' : Type u) [Field K] [Field K'] [Algebra K K']
    {X Y : Scheme.{u}} [X.Over (Spec (.of K))] [Y.Over (Spec (.of K))] [IsIntegral X]
    [IsIntegral Y] [X.IsProjectiveOver K] [Y.IsProjectiveOver K] {d : ℕ}
    (hX : topologicalKrullDim X = d) (hY : topologicalKrullDim Y = d) (f : X ⤏ Y)
    [f.IsDominant] [f.IsOver (Spec (.of K))] [(graph f).Over (Spec (.of K))]
    [(graphFst f).IsOver (Spec (.of K))] (L : LineBundleClass X →₀ ℝ)
    (M : LineBundleClass Y →₀ ℝ) (p q : ℕ) (hpq : p + q = d) :
    mixedDegree K f L M p q =
      realIntersection K' (pullback (graph f ↘ Spec (.of K))
          (Spec.map (CommRingCat.ofHom (algebraMap K K'))))
        (Fin.append
          (fun _ : Fin p ↦ L.mapDomain (LineBundleClass.pullback (pullback.fst _ _ ≫ graphFst f)))
          (fun _ : Fin q ↦
            M.mapDomain (LineBundleClass.pullback (pullback.fst _ _ ≫ graphSnd f)))) := by
  sorry

/-- **Sub-multiplicativity of the degrees** (README §4.4). Let `f_1 : X_1 ⤏ X_2` and
`f_2 : X_2 ⤏ X_3` be dominant `K`-rational maps between projective varieties of dimension `d`
and `L_1`, `L_2`, `L_3` nef real classes. For `p + q = d`,
`(L_2^d)·deg(f_2 ∘ f_1; L_1^p | L_3^q) ≤ (p + 1)^q·deg(f_1; L_1^p | L_2^q)·deg(f_2; L_2^p | L_3^q)`.
No positivity of `L_2` is needed in this multiplied form; when `(L_2^d) > 0`, in the README's
indexing `k = q`, it is the bound with constant `(d − k + 1)^k/(L_2^d)`. No normality is
assumed. Dang, Theorem 1 (i) and Theorem 5.2.1, for normal varieties over an algebraically
closed field; Dang–Favre, Theorem 1.3. -/
theorem mixedDegree_comp_le (K : Type u) [Field K] {X₁ X₂ X₃ : Scheme.{u}}
    [X₁.Over (Spec (.of K))] [X₂.Over (Spec (.of K))] [X₃.Over (Spec (.of K))]
    [IsIntegral X₁] [IsIntegral X₂] [IsIntegral X₃]
    [X₁.IsProjectiveOver K] [X₂.IsProjectiveOver K] [X₃.IsProjectiveOver K] {d : ℕ}
    (h₁ : topologicalKrullDim X₁ = d) (h₂ : topologicalKrullDim X₂ = d)
    (h₃ : topologicalKrullDim X₃ = d) (f₁ : X₁ ⤏ X₂) (f₂ : X₂ ⤏ X₃) [f₁.IsDominant]
    [f₂.IsDominant] [f₁.IsOver (Spec (.of K))] [f₂.IsOver (Spec (.of K))]
    (L₁ : LineBundleClass X₁ →₀ ℝ) (L₂ : LineBundleClass X₂ →₀ ℝ)
    (L₃ : LineBundleClass X₃ →₀ ℝ) (hL₁ : IsNef K L₁) (hL₂ : IsNef K L₂) (hL₃ : IsNef K L₃)
    (p q : ℕ) (hpq : p + q = d) :
    realIntersection K X₂ (fun _ : Fin d ↦ L₂) * mixedDegree K (f₁.comp f₂) L₁ L₃ p q ≤
      ((p + 1 : ℕ) : ℝ) ^ q * mixedDegree K f₁ L₁ L₂ p q * mixedDegree K f₂ L₂ L₃ p q := by
  sorry

/-- **Comparison of polarizations** (README §4.5). For real polarizations `ω`, `ω'` on a
projective variety `X` of dimension `d` and `p + q = d`, there is `C ≥ 1`, independent of the
map, with `deg(f; ω^p | ω^q) ≤ C·deg(f; ω'^p | ω'^q)` and the reverse inequality for every
dominant `K`-rational self-map `f`. Dang, Theorem 1 (ii); Dang–Favre, Theorem 1.3 (second
item). -/
theorem exists_mixedDegree_comparison (K : Type u) [Field K] {X : Scheme.{u}}
    [X.Over (Spec (.of K))] [IsIntegral X] [X.IsProjectiveOver K] {d : ℕ}
    (hX : topologicalKrullDim X = d) (ω ω' : LineBundleClass X →₀ ℝ) (hω : IsNef K ω)
    (hωd : 0 < realIntersection K X fun _ : Fin d ↦ ω) (hω' : IsNef K ω')
    (hω'd : 0 < realIntersection K X fun _ : Fin d ↦ ω') (p q : ℕ) (hpq : p + q = d) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))],
      mixedDegree K f ω ω p q ≤ C * mixedDegree K f ω' ω' p q ∧
        mixedDegree K f ω' ω' p q ≤ C * mixedDegree K f ω ω p q := by
  sorry

/-- A partial isomorphism defines a dominant rational map: its target is dense. This makes
the conjugate `φ ∘ f ∘ φ^{−1}` of a dominant self-map a dominant self-map (README,
Conventions). -/
instance isDominant_partialIso {X Y : Scheme.{u}} (φ : X.PartialIso Y) :
    φ.toRationalMap.IsDominant := by
  rw [Scheme.PartialMap.isDominant_toRationalMap_iff, Scheme.PartialIso.toPartialMap_hom]
  have := AlgebraicGeometry.Opens.isDominant_ι φ.dense_target
  exact inferInstanceAs (IsDominant (φ.iso.hom ≫ φ.target.ι))

/-- **Birational conjugacy of the degrees** (README §4.5). For a birational `K`-map
`φ : X ⇢ Y` between projective varieties of dimension `d`, real polarizations `ω_X`, `ω_Y` and
`p + q = d`, there is `C ≥ 1`, independent of the map, comparing the degrees of every dominant
`K`-rational self-map `f` of `X` and of its conjugate `φ ∘ f ∘ φ^{−1}`, written
`φ.symm.toRationalMap.comp (f.comp φ.toRationalMap)`. Dang, Theorem 1 (ii) and the remark after
it; Dinh–Sibony, Corollaire 7 (the estimate in its proof), over `ℂ` and for `Y = X`. -/
theorem exists_mixedDegree_birational_comparison (K : Type u) [Field K] {X Y : Scheme.{u}}
    [X.Over (Spec (.of K))] [Y.Over (Spec (.of K))] [IsIntegral X] [IsIntegral Y]
    [X.IsProjectiveOver K] [Y.IsProjectiveOver K] {d : ℕ} (hX : topologicalKrullDim X = d)
    (hY : topologicalKrullDim Y = d) (φ : X.PartialIso Y)
    (hφ : φ.IsOver (X ↘ Spec (.of K)) (Y ↘ Spec (.of K)))
    (ωX : LineBundleClass X →₀ ℝ) (ωY : LineBundleClass Y →₀ ℝ) (hωX : IsNef K ωX)
    (hωXd : 0 < realIntersection K X fun _ : Fin d ↦ ωX) (hωY : IsNef K ωY)
    (hωYd : 0 < realIntersection K Y fun _ : Fin d ↦ ωY) (p q : ℕ) (hpq : p + q = d) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))],
      mixedDegree K (φ.symm.toRationalMap.comp (f.comp φ.toRationalMap)) ωY ωY p q ≤
          C * mixedDegree K f ωX ωX p q ∧
        mixedDegree K f ωX ωX p q ≤
          C * mixedDegree K (φ.symm.toRationalMap.comp (f.comp φ.toRationalMap)) ωY ωY p q := by
  sorry

/-! ## Layer 5: Dynamical degrees and algebraic entropy -/

/-- The iterates of a dominant rational self-map (README, Conventions): `f^0 = id` and
`f^{n+1} = f^n ∘ f`, which in Mathlib's order of composition is `f.comp (f^n)`. -/
def iterate {X : Scheme.{u}} [IrreducibleSpace X] (f : X ⤏ X) [f.IsDominant] : ℕ → (X ⤏ X)
  | 0 => Scheme.RationalMap.id X
  | n + 1 => f.comp (iterate f n)

/-- The iterates of a dominant rational self-map are dominant. -/
instance isDominant_iterate {X : Scheme.{u}} [IrreducibleSpace X] (f : X ⤏ X) [f.IsDominant]
    (n : ℕ) : (iterate f n).IsDominant := by
  induction n with
  | zero => exact (inferInstance : (Scheme.RationalMap.id X).IsDominant)
  | succ n ih => exact (inferInstance : (f.comp (iterate f n)).IsDominant)

/-- The `k`-th dynamical degree `λ_k(f) = lim_n deg_{k,ω}(f^n)^{1/n}` of a dominant rational
self-map of a variety of dimension `d` with respect to a real class `ω` (README §5.1). For a
real polarization the limit exists and does not depend on `ω` (`tendsto_dynamicalDegree`,
`dynamicalDegree_eq_of_polarizations`). -/
def dynamicalDegree (K : Type u) [Field K] {X : Scheme.{u}} [X.Over (Spec (.of K))]
    [IrreducibleSpace X] (d k : ℕ) (f : X ⤏ X) [f.IsDominant] (ω : LineBundleClass X →₀ ℝ) :
    ℝ :=
  limUnder atTop fun n : ℕ ↦ mixedDegree K (iterate f n) ω ω (d - k) k ^ (1 / n : ℝ)

/-- The algebraic entropy `h_alg(f) = log max_{0 ≤ k ≤ d} λ_k(f)` (README §5.4). -/
def algebraicEntropy (K : Type u) [Field K] {X : Scheme.{u}} [X.Over (Spec (.of K))]
    [IrreducibleSpace X] (d : ℕ) (f : X ⤏ X) [f.IsDominant] (ω : LineBundleClass X →₀ ℝ) : ℝ :=
  Real.log ((Finset.range (d + 1)).sup' Finset.nonempty_range_add_one
    fun k ↦ dynamicalDegree K d k f ω)

/-- **Existence of the dynamical degrees** (README §5.1). For a dominant `K`-rational self-map
`f` of a projective variety of dimension `d`, a real polarization `ω` and `k ≤ d`, the sequence
`deg_{k,ω}(f^n)^{1/n}` converges to `λ_k(f)`, and
`λ_k(f) = inf_{n ≥ 1} (C_k(ω)·deg_{k,ω}(f^n))^{1/n}` with `C_k(ω) = (d − k + 1)^k/(ω^d)`.
Dang–Favre, §1.3 after Theorem 1.3; Dinh–Sibony, Corollaire 7, for convergence over `ℂ`;
Dang, Theorem 1; Truong, Theorem 1.1 (1). -/
theorem tendsto_dynamicalDegree (K : Type u) [Field K] {X : Scheme.{u}}
    [X.Over (Spec (.of K))] [IsIntegral X] [X.IsProjectiveOver K] {d : ℕ}
    (hX : topologicalKrullDim X = d) (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))]
    (ω : LineBundleClass X →₀ ℝ) (hω : IsNef K ω)
    (hωd : 0 < realIntersection K X fun _ : Fin d ↦ ω) (k : ℕ) (hk : k ≤ d) :
    Tendsto (fun n : ℕ ↦ mixedDegree K (iterate f n) ω ω (d - k) k ^ (1 / n : ℝ)) atTop
        (𝓝 (dynamicalDegree K d k f ω)) ∧
      dynamicalDegree K d k f ω =
        ⨅ n : ℕ+, (((d - k + 1 : ℕ) : ℝ) ^ k / realIntersection K X (fun _ : Fin d ↦ ω) *
          mixedDegree K (iterate f n) ω ω (d - k) k) ^ (1 / (n : ℝ)) := by
  sorry

/-- **The dynamical degrees are at least one** (README §5.2). -/
theorem one_le_dynamicalDegree (K : Type u) [Field K] {X : Scheme.{u}}
    [X.Over (Spec (.of K))] [IsIntegral X] [X.IsProjectiveOver K] {d : ℕ}
    (hX : topologicalKrullDim X = d) (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))]
    (ω : LineBundleClass X →₀ ℝ) (hω : IsNef K ω)
    (hωd : 0 < realIntersection K X fun _ : Fin d ↦ ω) (k : ℕ) (hk : k ≤ d) :
    1 ≤ dynamicalDegree K d k f ω := by
  sorry

/-- **Independence of the polarization** (README §5.2): the dynamical degrees computed with two
real polarizations agree. -/
theorem dynamicalDegree_eq_of_polarizations (K : Type u) [Field K] {X : Scheme.{u}}
    [X.Over (Spec (.of K))] [IsIntegral X] [X.IsProjectiveOver K] {d : ℕ}
    (hX : topologicalKrullDim X = d) (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))]
    (ω ω' : LineBundleClass X →₀ ℝ) (hω : IsNef K ω)
    (hωd : 0 < realIntersection K X fun _ : Fin d ↦ ω) (hω' : IsNef K ω')
    (hω'd : 0 < realIntersection K X fun _ : Fin d ↦ ω') (k : ℕ) (hk : k ≤ d) :
    dynamicalDegree K d k f ω = dynamicalDegree K d k f ω' := by
  sorry

/-- **Dynamical degrees of iterates** (README §5.2): `λ_k(f^m) = λ_k(f)^m`. -/
theorem dynamicalDegree_iterate (K : Type u) [Field K] {X : Scheme.{u}}
    [X.Over (Spec (.of K))] [IsIntegral X] [X.IsProjectiveOver K] {d : ℕ}
    (hX : topologicalKrullDim X = d) (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))]
    (ω : LineBundleClass X →₀ ℝ) (hω : IsNef K ω)
    (hωd : 0 < realIntersection K X fun _ : Fin d ↦ ω) (k : ℕ) (hk : k ≤ d) (m : ℕ) :
    dynamicalDegree K d k (iterate f m) ω = dynamicalDegree K d k f ω ^ m := by
  sorry

/-- **The extreme dynamical degrees** (README §5.2): `λ_0(f) = 1` and `λ_d(f) = e(f)`, the
topological degree, inseparable degree included. -/
theorem dynamicalDegree_zero_and_top (K : Type u) [Field K] {X : Scheme.{u}}
    [X.Over (Spec (.of K))] [IsIntegral X] [X.IsProjectiveOver K] {d : ℕ}
    (hX : topologicalKrullDim X = d) (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))]
    (ω : LineBundleClass X →₀ ℝ) (hω : IsNef K ω)
    (hωd : 0 < realIntersection K X fun _ : Fin d ↦ ω) :
    dynamicalDegree K d 0 f ω = 1 ∧ dynamicalDegree K d d f ω = topologicalDegree f := by
  sorry

/-- **Log-concavity of the dynamical degrees** (README §5.2):
`λ_{k−1}(f)·λ_{k+1}(f) ≤ λ_k(f)²` for `1 ≤ k ≤ d − 1`. -/
theorem dynamicalDegree_log_concave (K : Type u) [Field K] {X : Scheme.{u}}
    [X.Over (Spec (.of K))] [IsIntegral X] [X.IsProjectiveOver K] {d : ℕ}
    (hX : topologicalKrullDim X = d) (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))]
    (ω : LineBundleClass X →₀ ℝ) (hω : IsNef K ω)
    (hωd : 0 < realIntersection K X fun _ : Fin d ↦ ω) (k : ℕ) (hk : 1 ≤ k)
    (hkd : k + 1 ≤ d) :
    dynamicalDegree K d (k - 1) f ω * dynamicalDegree K d (k + 1) f ω ≤
      dynamicalDegree K d k f ω ^ 2 := by
  sorry

/-- **Birational invariance of the dynamical degrees** (README §5.3). For a birational `K`-map
`φ : X ⇢ Y` between projective varieties of dimension `d` and real polarizations `ω_X`, `ω_Y`,
the conjugate `φ ∘ f ∘ φ^{−1}` of a dominant `K`-rational self-map `f` of `X` has the same
dynamical degrees as `f`. Dinh–Sibony, Corollaire 7; Truong, Theorem 1.1 (2). -/
theorem dynamicalDegree_birational_conj (K : Type u) [Field K] {X Y : Scheme.{u}}
    [X.Over (Spec (.of K))] [Y.Over (Spec (.of K))] [IsIntegral X] [IsIntegral Y]
    [X.IsProjectiveOver K] [Y.IsProjectiveOver K] {d : ℕ} (hX : topologicalKrullDim X = d)
    (hY : topologicalKrullDim Y = d) (φ : X.PartialIso Y)
    (hφ : φ.IsOver (X ↘ Spec (.of K)) (Y ↘ Spec (.of K)))
    (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))]
    (ωX : LineBundleClass X →₀ ℝ) (ωY : LineBundleClass Y →₀ ℝ) (hωX : IsNef K ωX)
    (hωXd : 0 < realIntersection K X fun _ : Fin d ↦ ωX) (hωY : IsNef K ωY)
    (hωYd : 0 < realIntersection K Y fun _ : Fin d ↦ ωY) (k : ℕ) (hk : k ≤ d) :
    dynamicalDegree K d k (φ.symm.toRationalMap.comp (f.comp φ.toRationalMap)) ωY =
      dynamicalDegree K d k f ωX := by
  sorry

/-- **Invariance of the dynamical degrees under extension of the field** (README §5.3). Let `X` be
a geometrically integral projective variety of dimension `d` over `K`, `K'/K` a field extension
and `X'` the base change `X ×_K Spec K'`, with projection `π : X' → X` (`hπ`); `X'` is an
integral projective variety over `K'` and `π` is dominant. For a dominant `K`-rational self-map
`f` of `X`, its base change `f_{K'}` is the unique `K'`-rational self-map `f'` of `X'` with
`π ∘ f' = f ∘ π` (`hf`). For a real polarization `ω` on `X` and `k ≤ d`, `λ_k(f_{K'})` computed
with the pullback of `ω` is `λ_k(f)`. -/
theorem dynamicalDegree_baseChange (K K' : Type u) [Field K] [Field K'] [Algebra K K']
    {X X' : Scheme.{u}} [X.Over (Spec (.of K))] [X'.Over (Spec (.of K'))] [IsIntegral X]
    [IsIntegral X'] [X.IsProjectiveOver K] [X'.IsProjectiveOver K']
    [GeometricallyIntegral (X ↘ Spec (.of K))] {d : ℕ} (hX : topologicalKrullDim X = d)
    (π : X' ⟶ X) [IsDominant π]
    (hπ : IsPullback π (X' ↘ Spec (.of K')) (X ↘ Spec (.of K))
      (Spec.map (CommRingCat.ofHom (algebraMap K K'))))
    (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))]
    (f' : X' ⤏ X') [f'.IsDominant] [f'.IsOver (Spec (.of K'))]
    (hf : f'.compHom π = π.toRationalMap.comp f)
    (ω : LineBundleClass X →₀ ℝ) (hω : IsNef K ω)
    (hωd : 0 < realIntersection K X fun _ : Fin d ↦ ω) (k : ℕ) (hk : k ≤ d) :
    dynamicalDegree K' d k f' (ω.mapDomain (LineBundleClass.pullback π)) =
      dynamicalDegree K d k f ω := by
  sorry

/-- **Algebraic entropy of iterates** (README §5.4): `h_alg(f^n) = n·h_alg(f)`. -/
theorem algebraicEntropy_iterate (K : Type u) [Field K] {X : Scheme.{u}}
    [X.Over (Spec (.of K))] [IsIntegral X] [X.IsProjectiveOver K] {d : ℕ}
    (hX : topologicalKrullDim X = d) (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))]
    (ω : LineBundleClass X →₀ ℝ) (hω : IsNef K ω)
    (hωd : 0 < realIntersection K X fun _ : Fin d ↦ ω) (n : ℕ) :
    algebraicEntropy K d (iterate f n) ω = n * algebraicEntropy K d f ω := by
  sorry

/-- **Bounds for the algebraic entropy** (README §5.4):
`log e(f) ≤ h_alg(f) ≤ d·log λ_1(f)`; in particular `h_alg(f) ≥ 0`. -/
theorem algebraicEntropy_bounds (K : Type u) [Field K] {X : Scheme.{u}}
    [X.Over (Spec (.of K))] [IsIntegral X] [X.IsProjectiveOver K] {d : ℕ}
    (hX : topologicalKrullDim X = d) (f : X ⤏ X) [f.IsDominant] [f.IsOver (Spec (.of K))]
    (ω : LineBundleClass X →₀ ℝ) (hω : IsNef K ω)
    (hωd : 0 < realIntersection K X fun _ : Fin d ↦ ω) :
    Real.log (topologicalDegree f) ≤ algebraicEntropy K d f ω ∧
      algebraicEntropy K d f ω ≤ d * Real.log (dynamicalDegree K d 1 f ω) := by
  sorry

end

end TauCetiRoadmap.DynamicalDegreesOfRationalMaps
