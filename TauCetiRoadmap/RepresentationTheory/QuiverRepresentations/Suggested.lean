import Mathlib

/-!
# Quiver representations, path algebras, and Gabriel's theorem: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib has quivers (`Quiver`, `Quiver.Path`, `Prefunctor`), the free category on a quiver
(`CategoryTheory.Paths`), `ModuleCat`, `CategoryTheory.Simple` and `CategoryTheory.Indecomposable`,
finite-length modules (`IsFiniteLength`) with Jordan-Hölder, the Jacobson radical (`Ring.jacobson`),
Morita equivalence (`MoritaEquivalence`), and the root-system / Dynkin API. It has **no path algebra,
no theory of quiver representations, no Krull-Schmidt theorem, no Euler/Tits form, no reflection
functors, no Gabriel's theorem, and no Auslander-Reiten theory** (see `README.md` for the file-by-file
map).

The design follows the layers of `README.md`: Layer 0 the path algebra (`pathAlgebra`,
`pathAlgebraBasis`); Layer 1 representations as `kQ`-modules (`QuiverRep`, `quiverRepEquivalence`,
`simpleRep`, `indecProjRep`); Layer 2 Krull-Schmidt (`IsIndecomposableModule`,
`isLocalRing_end_of_isIndecomposable`, existence and uniqueness of the indecomposable decomposition);
Layer 3 the finite-dimensional-algebra frame (`exists_projectiveCover`, `cartanMatrix`, `IsBasic`,
`exists_quiver_admissibleIdeal_morita`); Layer 4 the Euler form and reflection functors (`eulerForm`,
`titsForm`, `dimVector`, `reflectionFunctor`, `coxeterFunctor`); Layer 5 Gabriel's theorem
(`IsFiniteRepType`, `gabriel_finiteRepType_iff`, and the indecomposable ↔ positive-root bijection); and
Layer 6 Auslander-Reiten theory (`arTranslate`, `IsAlmostSplit`, `IsIrreducibleMorphism`, `arQuiver`).
`README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.QuiverRepresentations

open CategoryTheory CategoryTheory.Limits Quiver
open scoped DirectSum

universe v u

/-! ## Layer 0: quivers and the path algebra -/

/-- **The path algebra** `kQ`: the free `k`-module on the paths of `Q`, with product given by
concatenating composable paths (`Quiver.Path.comp`) and sending non-composable pairs to `0`. The
underlying module is a `Finsupp`, so `AddCommGroup`/`Module k` come from Mathlib; the multiplication is
the content. -/
def pathAlgebra (k Q : Type*) [Field k] [Quiver Q] : Type _ :=
  (Σ a b : Q, Quiver.Path a b) →₀ k

/-- `kQ` is a ring: the unit is `∑ᵥ eᵥ` (the sum of trivial paths `Quiver.Path.nil`), the vertex
idempotents `eᵥ` are orthogonal, and associativity comes from `Quiver.Path.comp_assoc`. -/
noncomputable instance (k Q : Type*) [Field k] [Quiver Q] : Ring (pathAlgebra k Q) := sorry

noncomputable instance (k Q : Type*) [Field k] [Quiver Q] : Algebra k (pathAlgebra k Q) := sorry

/-- **The path basis**: the paths of `Q` are a `k`-basis of `kQ`, so the arrows generate `kQ` as a
`k`-algebra. -/
noncomputable def pathAlgebraBasis (k Q : Type*) [Field k] [Quiver Q] :
    Module.Basis (Σ a b : Q, Quiver.Path a b) k (pathAlgebra k Q) := sorry

/-- **Finite dimension.** `kQ` is finite-dimensional exactly when `Q` is finite and **acyclic**, encoded
as finitely many paths. (The loop quiver has infinitely many paths and `kQ ≅ k[X]`.) -/
theorem finiteDimensional_pathAlgebra (k Q : Type*) [Field k] [Quiver Q]
    [Finite (Σ a b : Q, Quiver.Path a b)] : FiniteDimensional k (pathAlgebra k Q) := sorry

/-! ## Layer 1: representations of a quiver as `kQ`-modules -/

/-- **The category of representations**: a functor out of the free category on `Q` into `ModuleCat k` is
exactly a `k`-module at each vertex and a `k`-linear map along each arrow, functorial in path
concatenation. -/
abbrev QuiverRep (k Q : Type*) [Field k] [Quiver Q] : Type _ := Paths Q ⥤ ModuleCat k

/-- **Representations are `kQ`-modules.** The load-bearing equivalence; every module-theoretic notion is
transported along it. -/
noncomputable def quiverRepEquivalence (k Q : Type*) [Field k] [Quiver Q] :
    QuiverRep k Q ≌ ModuleCat (pathAlgebra k Q) := sorry

/-- **The vertex simple** `Sᵢ`: `k` at `i`, `0` elsewhere. It is a simple representation, and over an
acyclic quiver these are all the simples. -/
noncomputable def simpleRep (k Q : Type*) [Field k] [Quiver Q] (i : Q) : QuiverRep k Q := sorry

theorem simpleRep_simple (k Q : Type*) [Field k] [Quiver Q] (i : Q) :
    Simple (simpleRep k Q i) := sorry

/-- **The indecomposable projective** `Pᵢ = kQ · eᵢ` (basis: paths starting at `i`), the projective
cover of `Sᵢ`. -/
noncomputable def indecProjRep (k Q : Type*) [Field k] [Quiver Q] (i : Q) : QuiverRep k Q := sorry

theorem projective_indecProjRep (k Q : Type*) [Field k] [Quiver Q] (i : Q) :
    Projective (indecProjRep k Q i) := sorry

/-! ## Layer 2: the Krull-Schmidt theorem -/

/-- **Indecomposable module**: nonzero and not an internal direct sum of two nonzero submodules. Mathlib
has `CategoryTheory.Indecomposable` for objects with biproducts, but no module-level predicate. -/
def IsIndecomposableModule (A M : Type*) [Ring A] [AddCommGroup M] [Module A M] : Prop :=
  Nontrivial M ∧ ∀ N P : Submodule A M, IsCompl N P → N = ⊥ ∨ P = ⊥

/-- **Fitting's lemma.** A finite-length module is indecomposable iff its endomorphism ring is local
(every endomorphism nilpotent or invertible). -/
theorem isLocalRing_end_of_isIndecomposable {A M : Type*} [Ring A] [AddCommGroup M] [Module A M]
    (hM : IsFiniteLength A M) (h : IsIndecomposableModule A M) :
    IsLocalRing (Module.End A M) := sorry

/-- **Existence of an indecomposable decomposition.** A finite-length module is an internal direct sum of
finitely many indecomposable submodules. -/
theorem exists_indecomposable_decomposition {A M : Type*} [Ring A] [AddCommGroup M] [Module A M]
    (hM : IsFiniteLength A M) :
    ∃ s : Finset (Submodule A M), (∀ N ∈ s, IsIndecomposableModule A N) ∧
      DirectSum.IsInternal (fun N : s => (N : Submodule A M)) := sorry

/-- **Krull-Schmidt uniqueness.** Two indecomposable decompositions of a finite-length module are matched
by a bijection under which corresponding summands are isomorphic. -/
theorem krullSchmidt_unique {A M : Type*} [Ring A] [AddCommGroup M] [Module A M]
    (hM : IsFiniteLength A M) {s t : Finset (Submodule A M)}
    (hs : ∀ N ∈ s, IsIndecomposableModule A N) (ht : ∀ N ∈ t, IsIndecomposableModule A N)
    (his : DirectSum.IsInternal (fun N : s => (N : Submodule A M)))
    (hit : DirectSum.IsInternal (fun N : t => (N : Submodule A M))) :
    ∃ e : s ≃ t, ∀ N : s, Nonempty ((N : Submodule A M) ≃ₗ[A] ((e N : Submodule A M))) := sorry

/-! ## Layer 3: the structure of a finite-dimensional algebra -/

/-- **Projective covers** (absent from Mathlib): an essential epimorphism from a projective, i.e. a
projective `P` with `P ↠ M` whose kernel is superfluous (every `Q → P` making the composite epi is
already epi). Unique up to isomorphism. -/
theorem exists_projectiveCover {A : Type*} [Ring A] (M : ModuleCat A)
    (hM : IsFiniteLength A M) :
    ∃ (P : ModuleCat A) (π : P ⟶ M), Projective P ∧ Epi π ∧
      ∀ (X : ModuleCat A) (i : X ⟶ P), Epi (i ≫ π) → Epi i := sorry

/-- **The Cartan matrix of the path algebra.** `Cᵢⱼ = [Pᵢ : Sⱼ]`, the Jordan-Hölder multiplicity of `Sⱼ`
in the projective cover `Pᵢ`; for a path algebra it counts paths `i → j`. Well-defined by
`CompositionSeries.jordan_holder`. Indexed by the vertices (= simples over an acyclic quiver). -/
noncomputable def cartanMatrix (k Q : Type*) [Field k] [Quiver Q] [Finite Q]
    [Finite (Σ a b : Q, Quiver.Path a b)] : Matrix Q Q ℕ := sorry

/-- **Basic algebra**: `A ⧸ Ring.jacobson A` is a product of division rings (no repeated Wedderburn matrix
block). Every finite-dimensional algebra is Morita-equivalent to a basic one. -/
def IsBasic (k A : Type*) [Field k] [Ring A] [Algebra k A] [FiniteDimensional k A] : Prop := sorry

/-- **Gabriel's presentation theorem.** Over an algebraically closed field, every finite-dimensional
algebra is Morita-equivalent to `kQ/I` for its Ext-quiver `Q` and an admissible ideal `I`; here recorded
as a surjection from a path algebra with the Morita equivalence. -/
theorem exists_quiver_admissibleIdeal_morita (k A : Type u) [Field k] [IsAlgClosed k] [Ring A]
    [Algebra k A] [FiniteDimensional k A] :
    ∃ (Q : Type) (_ : Quiver Q) (_ : Finite Q) (B : Type u) (_ : Ring B) (_ : Algebra k B)
      (f : pathAlgebra k Q →ₐ[k] B), Function.Surjective f ∧ Nonempty (MoritaEquivalence k A B) := sorry

/-! ## Layer 4: the Euler form, dimension vectors, and reflection functors -/

/-- **The Euler (Ringel) form** `⟨d, e⟩ = ∑ᵥ dᵥ eᵥ − ∑_{a : i → j} d_i e_j` on dimension vectors. -/
def eulerForm (Q : Type*) [Quiver Q] [Fintype Q] [∀ a b : Q, Fintype (a ⟶ b)]
    (d e : Q → ℤ) : ℤ :=
  (∑ v : Q, d v * e v) - ∑ a : Q, ∑ b : Q, ∑ _f : (a ⟶ b), d a * e b

/-- **The Tits form** `q(d) = ⟨d, d⟩`, a quadratic form; its positive-definiteness is the ADE condition,
its zero locus the imaginary roots. -/
def titsForm (Q : Type*) [Quiver Q] [Fintype Q] [∀ a b : Q, Fintype (a ⟶ b)] (d : Q → ℤ) : ℤ :=
  eulerForm Q d d

/-- **The dimension vector** `dim M v = dimₖ (Mᵥ)`, additive on direct sums and short exact sequences. -/
noncomputable def dimVector (k Q : Type*) [Field k] [Quiver Q] (M : QuiverRep k Q) : Q → ℕ :=
  fun v => Module.finrank k (M.obj v)

/-- **The reflected quiver**: the same vertices as `Q`, with all arrows at `i` reversed. A type synonym
carrying its own `Quiver` instance. -/
def ReflectedQuiver (Q : Type u) [Quiver Q] (_i : Q) : Type u := Q

noncomputable instance (Q : Type u) [Quiver Q] (i : Q) : Quiver (ReflectedQuiver Q i) := sorry

/-- **The reflection functor (BGP)** at a sink `i`, to the representations of the reflected quiver. -/
noncomputable def reflectionFunctor (k Q : Type*) [Field k] [Quiver Q] (i : Q) :
    QuiverRep k Q ⥤ QuiverRep k (ReflectedQuiver Q i) := sorry

/-- **The simple reflection at a vertex**, `sᵢ`, the reflection of the Tits form fixing the coordinate
hyperplane and negating `αᵢ`; matches `RootPairing.reflection` on the associated root system. -/
def vertexReflection (Q : Type*) [Quiver Q] [Fintype Q] [∀ a b : Q, Fintype (a ⟶ b)] [DecidableEq Q]
    (i : Q) (d : Q → ℤ) : Q → ℤ := sorry

/-- The reflection functor acts on dimension vectors by the simple reflection `sᵢ` (for `M` with no `Sᵢ`
summand). -/
theorem dimVector_reflectionFunctor {k Q : Type*} [Field k] [Quiver Q] [Fintype Q]
    [∀ a b : Q, Fintype (a ⟶ b)] [DecidableEq Q] (i : Q) (M : QuiverRep k Q)
    (hM : IsEmpty ((simpleRep k Q i) ⟶ M)) :
    (fun v => (dimVector k _ ((reflectionFunctor k Q i).obj M) v : ℤ))
      = vertexReflection Q i (fun v => (dimVector k Q M v : ℤ)) := sorry

/-- **The Coxeter functor** `C⁺`, the composite of the reflection functors over a sink-admissible ordering
of the vertices; on dimension vectors it realizes the Coxeter element `c = s₁ ⋯ sₙ`. -/
noncomputable def coxeterFunctor (k Q : Type*) [Field k] [Quiver Q] [Finite Q] :
    QuiverRep k Q ⥤ QuiverRep k Q := sorry

/-! ## Layer 5: Gabriel's theorem (the ADE classification) -/

/-- **Finite representation type**: only finitely many isomorphism classes of finite-dimensional
indecomposable representations. -/
def IsFiniteRepType (k Q : Type*) [Field k] [Quiver Q] : Prop := sorry

/-- **Gabriel's dichotomy.** A connected quiver has finite representation type iff its Tits form is
positive definite, i.e. its underlying graph is a simply-laced (ADE) Dynkin diagram (`CoxeterMatrix.A`,
`.D`, `.E₆`, `.E₇`, `.E₈`). The Kronecker quiver `• ⇉ •` (Tits form positive *semi*definite) is the
boundary. -/
theorem gabriel_finiteRepType_iff (k Q : Type*) [Field k] [IsAlgClosed k] [Quiver Q] [Fintype Q]
    [∀ a b : Q, Fintype (a ⟶ b)] (hconn : Subsingleton (Quiver.WeaklyConnectedComponent Q)) :
    IsFiniteRepType k Q ↔ ∀ d : Q → ℤ, d ≠ 0 → 0 < titsForm Q d := sorry

/-- **Indecomposables are determined by their dimension vector** (each is a brick). Over an ADE quiver,
`dimVector` is injective on indecomposables up to isomorphism. -/
theorem indecomposable_unique_of_dimVector_eq {k Q : Type*} [Field k] [IsAlgClosed k] [Quiver Q]
    [Fintype Q] [∀ a b : Q, Fintype (a ⟶ b)]
    (hADE : ∀ d : Q → ℤ, d ≠ 0 → 0 < titsForm Q d) (M N : QuiverRep k Q)
    (hM : Indecomposable M) (hN : Indecomposable N) (h : dimVector k Q M = dimVector k Q N) :
    Nonempty (M ≅ N) := sorry

/-- **Indecomposables ↔ positive roots.** Over an ADE quiver, the dimension vectors of the
finite-dimensional indecomposables are exactly the positive roots of the associated root system: the
positive integer vectors `d` with `titsForm d = 1`. (Positive roots are here characterized intrinsically
by the Tits form; cf. `posRoots` in `../RootSystems/README.md`.) -/
theorem dimVector_isRoot_iff {k Q : Type*} [Field k] [IsAlgClosed k] [Quiver Q] [Fintype Q]
    [∀ a b : Q, Fintype (a ⟶ b)]
    (hADE : ∀ d : Q → ℤ, d ≠ 0 → 0 < titsForm Q d) (d : Q → ℕ) :
    (∃ M : QuiverRep k Q, Indecomposable M ∧ dimVector k Q M = d) ↔
      (d ≠ 0 ∧ titsForm Q (fun v => (d v : ℤ)) = 1) := sorry

/-! ## Layer 6: Auslander-Reiten theory -/

/-- **The Auslander-Reiten translate** `τ = D Tr`: the composite of the transpose `Tr` (from a minimal
projective presentation) and the `k`-duality `D`. A bijection from non-projective indecomposables to
non-injective indecomposables. -/
noncomputable def arTranslate (k Q : Type*) [Field k] [Quiver Q] :
    QuiverRep k Q ⥤ QuiverRep k Q := sorry

/-- **Irreducible morphism**: neither a split mono nor a split epi, and in every factorization
`f = h ≫ g`... one factor splits. The arrows of the AR quiver. -/
def IsIrreducibleMorphism {k Q : Type*} [Field k] [Quiver Q] {M N : QuiverRep k Q}
    (f : M ⟶ N) : Prop := sorry

/-- **Almost-split (AR) sequence**: a non-split short exact sequence `0 → τM → E → M → 0`, right almost
split at `M` and left almost split at `τM`, with `M` indecomposable non-projective. -/
def IsAlmostSplit {k Q : Type*} [Field k] [Quiver Q]
    (S : CategoryTheory.ShortComplex (QuiverRep k Q)) : Prop := sorry

/-- **Existence and uniqueness of almost-split sequences** (the Auslander-Reiten theorem): for each
indecomposable non-projective `M` there is an almost-split sequence ending at `M`. -/
theorem exists_almostSplitSequence {k Q : Type*} [Field k] [IsAlgClosed k] [Quiver Q] [Finite Q]
    (M : QuiverRep k Q) (hM : Indecomposable M) (hproj : ¬ Projective M) :
    ∃ S : CategoryTheory.ShortComplex (QuiverRep k Q),
      IsAlmostSplit S ∧ Nonempty (S.X₃ ≅ M) := sorry

/-- **The Auslander-Reiten quiver**: a quiver whose vertices are isomorphism classes of
finite-dimensional indecomposables and whose arrows are a basis of the irreducible morphisms
`rad(M, N) / rad²(M, N)`. Finite for a representation-finite algebra. -/
noncomputable def arQuiver (k Q : Type*) [Field k] [Quiver Q] : Type _ := sorry

noncomputable instance (k Q : Type*) [Field k] [Quiver Q] : Quiver (arQuiver k Q) := sorry

end TauCetiRoadmap.RepresentationTheory.QuiverRepresentations
