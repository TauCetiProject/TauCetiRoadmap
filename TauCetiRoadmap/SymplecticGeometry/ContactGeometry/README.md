# Roadmap: contact geometry and contact dynamics

**Summary.** A contact structure on a manifold `M` of dimension `2n + 1` is a field of hyperplanes
`ξ ⊂ TM` that is as far from integrable as possible: its Levi form, the Lie bracket of two
sections of `ξ` taken modulo `ξ`, is a nondegenerate alternating form on `ξ` with values in the
line bundle `L = TM/ξ`, the contact line. This roadmap develops the geometry and the dynamics of
contact structures on real smooth manifolds. The structure is the primary object. A contact form,
a one-form `α` with `ξ = ker α`, exists exactly when `L` is trivial, and a coorientation, an
orientation of `L`, is further data; statements that need either say so, and the
noncoorientable case is carried throughout. Manifolds are
finite-dimensional, Hausdorff, second countable and without boundary.

The headline theorems are these.

- *Darboux.* Every point of a contact manifold has a chart in which `ξ` is the kernel of the
  standard form `dz − Σ pᵢ dqᵢ` on `ℝⁿ × ℝⁿ × ℝ`. For a chosen contact form `α` the chart can be
  taken with `α` equal to the standard form, not only proportional to it.
- *Gray stability.* A smooth family of contact structures `ξₜ`, `t ∈ [0, 1]`, on a closed
  manifold is induced by an isotopy, `dφₜ(ξ₀) = ξₜ`. If the `ξₜ` agree at every point of a subset
  `K`, an isotopy fixing `K` exists on a neighbourhood of `K`, with no compactness and no
  coorientation.
- *Neighbourhood theorems.* A closed embedded isotropic submanifold has a neighbourhood determined
  up to contactomorphism by its contact line and its conformal symplectic normal bundle. An
  embedded Legendrian submanifold `Λ` of `(M, α)`, closed or not, has a neighbourhood on which `α` is
  pulled back exactly from the one-jet form `dz − λ` on `T*Λ × ℝ`.
- *Jacobi bracket.* For a contact form `α`, the bracket `{f, g} = dα(X_f, X_g) + f R_α(g) − g R_α(f)`
  of the contact Hamiltonian vector fields satisfies the Jacobi identity, and the contact
  Hamiltonian vector field of `{f, g}` is `[X_f, X_g]`.

The pointwise theory (contact forms and distributions, the Levi form, Reeb and contact Hamiltonian
vector fields, the cooriented symplectization, the contactization, the standard models) comes from
the Tau Ceti library; this roadmap builds the bundle-level and global theory on it.
DifferentialGeometry supplies forms, flows and distributions; SmoothBundlesConnections bundle
operations, connections and transport; GeometricTopology tubular neighbourhoods;
CotangentLagrangian the Liouville form and the unit cosphere bundle, and it uses the contact
predicate fixed here; SymplecticFieldTheory consumes the Reeb dynamics and the symplectization.

Layer 1 builds the contact line, coorientations, the volume criterion and the standard models; Layer
2 the Reeb field, contact flows and contactomorphisms; Layer 3 proves Darboux and Gray; Layer 4
builds the symplectization of a contact structure on the punctured dual of `L`, the lifts of
contactomorphisms, Liouville collars and the contactization; Layer 5 proves the neighbourhood
theorems, with one-jet spaces and unit conormals; Layer 6 builds the Jacobi bracket, its line-valued
form, its comparison with the symplectization and the sign adapter to Floer theory.

## How to read the build

Layer `k` below is the milestone that other roadmaps cite as `CGk`. Each layer opens with the
Tau Ceti declarations it consumes and then states its own targets in numbered sections; the
headline theorems that are statable at the pinned libraries are declared in `Suggested.lean` and
named here in code font. Each *Needs:* line lists what a statement and its route use, item by item,
so that a target proved another way is not held up by an unrelated section. Only the twisted
one-jet model of §5.5 uses first jets of a line bundle; only §5.2 and §5.5 use bundle transport;
nothing here uses densities, Sobolev spaces or pseudodifferential analysis. Every construction
comes with its restriction to open subsets, its behaviour under a change of local contact form and
under pullback by diffeomorphisms, and its compatibility with composition, before the
neighbourhood theorems of Layer 5 use it.

## Conventions

1. **Manifolds.** Manifolds are real, finite-dimensional, smooth (`C^∞`), Hausdorff and second
countable, and without boundary (`BoundarylessManifold`) unless a statement says otherwise; a local
statement that does not use the Hausdorff or countability hypotheses does not assume them. The
dimension `dim M = 2n + 1` is explicit wherever `n` enters a statement. A *closed embedded
submanifold* is the image of a smooth embedding (Mathlib's `Manifold.IsSmoothEmbedding`) of a
manifold without boundary, closed as a subset; it need not be compact. A *closed manifold* is
compact and without boundary.
2. **Forms and fields.** Forms are Tau Ceti's: smooth `k`-forms
`TauCeti.SmoothForm I M ℝ k`, rough forms `TauCeti.RoughForm`, the exterior derivative
`TauCeti.mextDeriv`, pullback `TauCeti.mpullback` and `TauCeti.SmoothForm.mpullback`, the Lie
derivative `TauCeti.mlieDerivForm` and the wedge product `TauCeti.RoughForm.wedge`. A distribution
is a family `D x : Submodule ℝ (TangentSpace I x)`, smooth in the sense of
`TauCeti.IsContMDiffDistribution`, with local frames `TauCeti.IsDistributionFrameOn`; contact
notions are predicates on such families, not a new structure. The exterior derivative of a one-form
is `dα(X, Y) = X α(Y) − Y α(X) − α([X, Y])`, with Mathlib's Lie bracket `VectorField.mlieBracket`.
3. **Contact structures.** The primary object is a hyperplane distribution `ξ` of rank `2n` whose
Levi form `L_ξ(u, v) = −[U, V] mod ξ` (`TauCeti.distributionLeviForm`) is nondegenerate: for each
`x` the map `ξₓ → Hom(ξₓ, Tₓ M/ξₓ)`, `u ↦ L_ξ(u, ·)`, is an isomorphism. This is Tau Ceti's
`TauCeti.IsContactDistribution I ∞ ξ`. The minus sign is chosen so that, when `ξ = ker α`, the
isomorphism `TM/ξ ≅ ℝ` induced by `α` carries `L_ξ` to `dα|ξ`
(`TauCeti.SmoothForm.liftQ_distributionLeviForm_kerDistribution`).
4. **Four distinct objects.** (a)
The contact distribution `ξ`. (b) Its contact line `L = TM/ξ`. (c) A coorientation: an orientation
of `L`. (d) A contact form: a nowhere-zero section of the annihilator line `ξ⁰ ⊂ T*M`, equivalently
a trivialization of `L`. A global contact form exists exactly when `ξ⁰` is trivial (§1.2); a contact
form is never part of the definition of a contact structure.
5. **Contact forms.** A one-form `α` is
a contact form when `αₓ ≠ 0` and `dαₓ` is nondegenerate on `ker αₓ` at every point
(`TauCeti.SmoothForm.IsContactForm`); in dimension `2n + 1` this is the pointwise nonvanishing of
`α ∧ (dα)ⁿ` (§1.3), a pointwise condition, not a choice of orientation or of a normalized volume
form. Replacing `α` by `f α` with `f` nowhere zero keeps `ξ`; `f > 0` keeps the coorientation and
`f < 0` reverses it.
6. **Standard models.** The standard form is `α_std = dz − Σ pᵢ dqᵢ` on
`ℝⁿ × ℝⁿ × ℝ` with coordinates `(q, p, z)` (`TauCeti.innerProductContactForm` on
`EuclideanSpace ℝ (Fin n)`). For `n = 1` it is Tau Ceti's `dz − x dy`
(`TauCeti.standardContactForm`) under `(q, p, z) = (y, x, z)`
(`TauCeti.mpullback_innerProductContactForm_real`), and DifferentialGeometry's displayed model
`dz − y dx` under `(q, p, z) = (x, y, z)`. These identify the same standard model by explicit linear
coordinate changes.
7. **Signs.** Symplectic conventions are those of the SymplecticGeometry family:
`ω = −dλ` for a primitive `λ`, Hamiltonian vector fields by `ι_(X_f) ω = df`, Poisson bracket
`{F, G}_ω = ω(X_F, X_G) = dF(X_G)`. The Reeb field of a contact form is fixed by `α(R_α) = 1` and
`ι_(R_α) dα = 0`. The contact Hamiltonian vector field of a function `H` is fixed by `α(X_H) = H`
and `ι_(X_H) dα = (R_α H) α − dH`; Cartan's formula then gives `L_(X_H) α = (R_α H) α`, so its local
flow preserves `ξ` and its coorientation. A source using `α(X) = −H` instead obtains `X_(−H)` in
this convention; for it, `ι_X dα = dH − (R_α H) α`.
8. **Names.** The Lean names of this roadmap
live in `TauCetiRoadmap.SymplecticGeometry.ContactGeometry`. A target without a declaration in
`Suggested.lean` is described in words.

<a id="cg1--contact-distributions-contact-line-and-cooriented-forms"></a>

## Layer 1: contact distributions, contact line and cooriented forms

The pointwise theory is Tau Ceti's and is consumed here: the Levi form of a `C¹` distribution
(`TauCeti.distributionLeviForm`, alternating and tensorial, computed from any extensions by
`TauCeti.distributionLeviForm_apply`, and zero exactly for involutive distributions); contact
distributions (`TauCeti.IsContactDistribution`, with odd dimension, contact line of dimension one
and nonintegrability); contact forms (`TauCeti.SmoothForm.IsContactForm`) and their kernels, which
are exactly the contact distributions that have a global defining form
(`TauCeti.SmoothForm.isContactForm_iff_isContactDistribution_kerDistribution`); local defining
forms of a contact distribution (`TauCeti.IsContactDistribution.exists_isContactFormAt`); the Levi
form criterion for forms (`TauCeti.SmoothForm.isContactForm_iff_forall_bijective_distributionLeviForm`);
transition functions between defining forms
(`TauCeti.SmoothForm.kerDistribution_eq_iff_existsUnique_fun_smul`); invariance under pullback by
local diffeomorphisms (`TauCeti.isContactFormAt_mpullback_iff`); and the linear normal form at a
point (`TauCeti.SmoothForm.IsContactForm.exists_linearEquiv_eq_stdContact`). The targets below
make the contact line and the annihilator line smooth bundles, define coorientations, prove the
volume criterion and assemble the standard models.

### 1.1 The contact line and the Levi form as a bundle map

For a smooth distribution `D` of constant rank `k` on `M`, construct the quotient bundle `TM/D` as a
smooth real vector bundle of rank `dim M − k`, with fibre `Tₓ M/Dₓ` at `x`, from adapted local
frames: a local frame of `D` (`TauCeti.IsDistributionFrameOn`) completed by `dim M − k` vector
fields whose values span a complement, the transition functions being the blocks of the
change-of-frame matrices that act on the complementary vectors modulo `D`. For a contact
distribution `ξ` this is the **contact line** `L = TM/ξ`, the target of the Levi form
(Courte–Guillermou, p. 35).
*Needs:* Tau Ceti `TauCeti.IsContMDiffDistribution`, `TauCeti.IsDistributionFrameOn`,
`TauCeti.distributionLeviForm`, `TauCeti.distributionLeviForm_apply`,
`TauCeti.IsContactDistribution`; Mathlib `VectorBundle`, `ContMDiffVectorBundle`;
SmoothBundlesConnections §B2.1 (dual and Hom bundles).

- The projection `TM → TM/D` is a smooth surjective bundle map with kernel `D`, and a smooth
  section of `TM/D` lifts locally to a smooth vector field.
- A diffeomorphism `F : M → M'` with `dF(D) = D'` induces a smooth bundle isomorphism
  `TM/D → F*(TM'/D')`, compatible with composition and with restriction to open subsets.
- The Levi form of `D` is a smooth section of `Hom(Λ²D, TM/D)`: for smooth sections `U` and `V` of
  `D`, `x ↦ L_D(Uₓ, Vₓ)` is the smooth section `−[U, V] mod D`.
- For a contact distribution `ξ`, `u ↦ L_ξ(u, ·)` is a smooth bundle isomorphism
  `ξ ≅ Hom(ξ, L)`; in particular the contact line has rank one and `L_ξ` is a nondegenerate
  `L`-valued symplectic form on `ξ`.

**Checks.**
- For `ξ = ker(dz − x dy)` on `ℝ³`, the frame `U = ∂_x`, `V = ∂_y + x ∂_z` of `ξ` has
  `[U, V] = ∂_z`, so `L_ξ(U, V) = −∂_z mod ξ`, and `α(−∂_z) = −1 = dα(U, V)` for `α = dz − x dy`,
  `dα = −dx ∧ dy`. A Levi form defined as `+[U, V] mod ξ` would send `L_ξ` to `−dα|ξ`.
- For `D = span(∂_x, ∂_y)` on `ℝ³`, which is involutive, the Levi form vanishes and `u ↦ L_D(u, ·)`
  is the zero map, not an isomorphism: rank alone does not make a hyperplane field contact.

### 1.2 The annihilator line, local contact forms and coorientations

For a hyperplane distribution `ξ`, construct the annihilator `ξ⁰ ⊂ T*M`, the covectors vanishing
on `ξ`, as a smooth line subbundle of the cotangent bundle, and identify it with the dual `L*` of
the contact line by composing with the projection `TM → L`. A **local contact form** on an open set
`U` is a nowhere-zero smooth section of `ξ⁰` over `U`; Tau Ceti's
`TauCeti.IsContMDiffDistribution.exists_local_annihilator` and
`TauCeti.IsContactDistribution.exists_isContactFormAt` give them near every point, and any two on
an overlap differ by a unique nowhere-zero smooth multiplier
(`TauCeti.SmoothForm.kerDistribution_eq_iff_existsUnique_fun_smul`). Define a **coorientation** of
`ξ` as an orientation of `L`: a choice of orientation (Mathlib's `Orientation`) of each fibre
`Tₓ M/ξₓ` that near every point is the one in which some local contact form is positive; call `ξ`
coorientable when one exists.
*Needs:* §1.1; Tau Ceti `TauCeti.IsContMDiffDistribution.exists_local_annihilator`,
`TauCeti.IsContactDistribution.exists_isContactFormAt`,
`TauCeti.SmoothForm.kerDistribution_eq_iff_existsUnique_fun_smul`,
`TauCeti.SmoothForm.IsContactForm.isContactForm_iff_of_kerDistribution_eq`; Mathlib `Orientation`;
SmoothBundlesConnections §B2.1.

- `ξ⁰ ≅ L*` as smooth line bundles, and the local contact forms with kernel `ξ` are exactly the
  nowhere-zero local sections of `ξ⁰`; every one of them is a contact form on its domain.
- A global contact form with kernel `ξ` exists if and only if `ξ⁰` is trivial, if and only if `L`
  is trivial, if and only if `ξ` is coorientable (Geiges, §2, p. 4).
- A contact form `α` with kernel `ξ` determines the coorientation in which `α`, read as a map
  `L → ℝ`, is positive; `f α` determines the same coorientation exactly where `f > 0` and the
  opposite one exactly where `f < 0`. On a connected manifold a coorientable `ξ` has exactly two
  coorientations.
- The constructions commute with restriction to open subsets and with pullback by diffeomorphisms
  preserving the distributions.

**Checks.**
- On `ℝ² × S¹`, with `τ ∈ ℝ/2πℤ`, the form `α = cos τ dx + sin τ dy` is contact, with
  `α ∧ dα = −dx ∧ dy ∧ dτ`. The involution `τ ↦ τ + π` sends `α` to `−α`, so `ξ` descends to
  `ℝ² × ℝP¹`, the space of contact elements of the plane. There `ξ` is not coorientable: a global
  defining form would pull back to `f α` with `f` of constant sign on the connected cover, and
  invariance under the involution forces `f(τ + π) = −f(τ)`. A definition of contact structures
  through global forms would miss this example.
- `−α` defines the same contact distribution as `α` and the opposite coorientation; Tau Ceti's
  `(q, p, z) ↦ (q, −p, −z)` pulls `α_std` back to `−α_std`
  (`TauCeti.mpullback_innerProductContactForm_neg`).

### 1.3 The volume criterion

Prove that a smooth one-form `α` on a `(2n + 1)`-manifold is a contact form at `x`
(`TauCeti.IsContactFormAt`) if and only if `(α ∧ (dα)ⁿ)ₓ ≠ 0`; hence `α` is a contact form if and
only if `α ∧ (dα)ⁿ` vanishes nowhere. For a contact distribution, every local contact form
satisfies the criterion on its domain, so the criterion and the Levi nondegeneracy of §1.1 are
equivalent in the line-valued formulation (Courte–Guillermou, pp. 34–35).
*Needs:* Tau Ceti `TauCeti.SmoothForm.IsContactForm`, `TauCeti.IsContactFormAt`,
`TauCeti.SmoothForm.isContactForm_iff_forall_isContactFormAt`, `TauCeti.RoughForm.wedge`,
`TauCeti.mextDeriv`; Mathlib `ContinuousAlternatingMap`.

- `(f α) ∧ (d(f α))ⁿ = fⁿ⁺¹ α ∧ (dα)ⁿ` for a smooth function `f` (Geiges, Remark 2.2, pp. 4–5).
- Consequently `(−α) ∧ (d(−α))ⁿ = (−1)ⁿ⁺¹ α ∧ (dα)ⁿ`: for `n` odd a contact structure orients `M`
  by itself, and for `n` even the orientation of `M` defined by `α ∧ (dα)ⁿ` changes with the
  coorientation.

**Checks.**
- On `ℝ³`, `(dz − x dy) ∧ d(dz − x dy) = −dx ∧ dy ∧ dz`, nowhere zero.
- On `ℝ⁵` with coordinates `(x, y, z, u, v)`, `α = dz − x dy` is nowhere zero and `dα = −dx ∧ dy`
  is nowhere zero, but `α ∧ (dα)² = 0`: `∂_u` and `∂_v` lie in `ker α` and in the kernel of `dα`, so
  `α` is not a contact form. A criterion asking only that `dα` be nonzero on `ker α` would accept
  it.

### 1.4 Standard models

The standard models are Tau Ceti's: `α_std` on `ℝⁿ × ℝⁿ × ℝ` (`TauCeti.innerProductContactForm`,
contact by `TauCeti.isContactForm_innerProductContactForm`, with `dα_std = Σ dqᵢ ∧ dpᵢ` by
`TauCeti.mextDeriv_innerProductContactForm_euclideanSpace_apply`); `dz − x dy` on `ℝ³` with its
kernel `TauCeti.standardContactDistribution ℝ` (`TauCeti.kerDistribution_standardContactForm`,
`TauCeti.isContactDistribution_standardContactDistribution`, the frame `∂_x`, `∂_y + x ∂_z`, Reeb
field `∂_z` by `TauCeti.reebVectorField_standardContactForm`, and nonintegrability
`TauCeti.not_isInvolutiveDistribution_standardContactDistribution`); the coordinate adapter
`TauCeti.mpullback_innerProductContactForm_real`; and the unit sphere `S²ⁿ⁺¹ ⊂ ℂⁿ⁺¹` with the
restriction of `Σⱼ (xⱼ dyⱼ − yⱼ dxⱼ)` (`TauCeti.SymplecticForm.sphereContactForm` for
`ω = 2 Σⱼ dxⱼ ∧ dyⱼ`, contact by
`TauCeti.SymplecticForm.isContactForm_sphereContactForm` because the radial Liouville field is
transverse to the sphere, `TauCeti.SymplecticForm.isRestrictedContactType_sphere`). The 3D model is
not constructed a second time; DifferentialGeometry's acceptance examples of Layer 4 (the model
`dz − y dx` through the coordinate swap, and the absence of integral surfaces through any point) are
consumed through the adapter. Prove that
`α_std ∧ (dα_std)ⁿ = n! dz ∧ dq₁ ∧ dp₁ ∧ ⋯ ∧ dqₙ ∧ dpₙ`.
*Needs:* §1.3; Tau Ceti `TauCeti.innerProductContactForm`,
`TauCeti.mextDeriv_innerProductContactForm_euclideanSpace_apply`; DifferentialGeometry Layer 4
(acceptance examples).

**Checks.**
- For `n = 1` the formula gives `dz ∧ dq ∧ dp`; under `(q, p, z) = (y, x, z)` this is
  `dz ∧ dy ∧ dx = −dx ∧ dy ∧ dz`, the value of §1.3, so the formula and the adapter agree on sign.

### Examples

- The space of contact elements `ℝ² × ℝP¹` of §1.2 is a contact manifold with nontrivial contact
  line; its double cover `ℝ² × S¹` carries the global form `cos τ dx + sin τ dy`.
- The unit sphere `S³ ⊂ ℂ²` with `x₁ dy₁ − y₁ dx₁ + x₂ dy₂ − y₂ dx₂` and `ℝ³` with `dz − x dy` are
  cooriented contact manifolds.

### Dependencies

Tau Ceti: the Levi form, contact distributions and forms, local defining forms, transition
functions, the linear normal form, the standard models and the sphere. Mathlib: smooth vector
bundles, orientations, exterior algebra. DifferentialGeometry Layers 0, 1 and 4 (forms, exterior
derivative, distributions and the contact acceptance examples). SmoothBundlesConnections §B2.1.

## Layer 2: Reeb dynamics, contact vector fields and local flow

The Reeb vector field of a contact form is Tau Ceti's `TauCeti.SmoothForm.reebVectorField`, the
unique field with `α(R_α) = 1` and `ι_(R_α) dα = 0`
(`TauCeti.SmoothForm.IsContactForm.eq_reebVectorField_iff`, solved through the invertible contact
flat map `v ↦ ι_v dα + α(v) α`, `TauCeti.SmoothForm.IsContactForm.isInvertible_contactFlat`),
smooth (`TauCeti.SmoothForm.IsContactForm.contMDiff_reebVectorField`) and transverse to `ξ`. Its
rescaling law `R_(fα) = R_α/f + Y`, with `Y ∈ ξ` the unique vector with `ι_Y dα|ξ = df|ξ / f²`, is
`TauCeti.SmoothForm.IsContactForm.reebVectorField_eq_inv_smul_add_iff`; for `α = dz − x dy` the
Reeb field is `∂_z` and that of `eˣ α` is `e⁻ˣ(∂_y + (x + 1) ∂_z)`
(`TauCeti.reebVectorField_of_eq_exp_smul_standardContactForm`). Contact Hamiltonian vector fields
are `TauCeti.SmoothForm.IsContactHamiltonianVectorField` and
`TauCeti.SmoothForm.contactHamiltonianVectorField`, unique for a contact form
(`TauCeti.SmoothForm.IsContactForm.isContactHamiltonianVectorField_iff_eq`), with
`L_(X_H) α = (R_α H) α` (`TauCeti.SmoothForm.IsContactHamiltonianVectorField.mlieDerivForm_eq`),
infinitesimal preservation of `ξ`
(`TauCeti.SmoothForm.IsContactHamiltonianVectorField.mlieBracket_mem_kerDistribution`), and the
converse that a vector field `X` with `L_X α` a multiple of `α` is `X_(α(X))`
(`TauCeti.SmoothForm.IsContactForm.eq_contactHamiltonianVectorField_of_mlieDerivForm_eq_smul`).
Strict contactomorphisms intertwine Reeb fields
(`TauCeti.SmoothForm.IsContactForm.mfderiv_reebVectorField_mpullback`).

### 2.1 The Reeb field under rescaling

For a contact form `α` and a nowhere-zero smooth `f`, prove the normalized form of the rescaling
law: `R_(fα) = (R_α + Z)/f`, where `Z = f Y ∈ ξ` is the unique vector of `ξ` with
`ι_Z dα|ξ = df|ξ / f`; and `α(R_(fα)) = 1/f`, which is where the factor `f²` of the Tau Ceti form
comes from. Both equations are verified directly from the defining equations of `R_(fα)`.
*Needs:* Tau Ceti `TauCeti.SmoothForm.reebVectorField`,
`TauCeti.SmoothForm.IsContactForm.reebVectorField_eq_inv_smul_add_iff`,
`TauCeti.SmoothForm.IsContactForm.isCompl_kerDistribution_span_reebVectorField`.

**Checks.**
- For `α = dz − x dy` and `f = eˣ`, `R_(fα) = e⁻ˣ(∂_y + (x + 1) ∂_z)` gives `Z = ∂_y + x ∂_z`:
  `α(Z) = x − x = 0`, and `dα(Z, w) = w_x = (df/f)(w)` for every `w`. Imposing `df/f²` on `Z`
  instead would give `Z = e⁻ˣ(∂_y + x ∂_z)` and `(R_α + Z)/f ≠ R_(fα)`.

### 2.2 Flows of contact vector fields

Let `H` be a smooth function and `φ` the maximal local flow of `X_H` (Tau Ceti `TauCeti.flowOf` on
its open domain `TauCeti.flowDomain`). Prove that on the flow domain
`φₜ^* α = gₜ α` with `gₜ(x) = exp(∫₀ᵗ (R_α H)(φₛ x) ds) > 0`; so each `φₜ` is a
coorientation-preserving contactomorphism between open subsets, and it is strict when
`R_α H = 0`, in particular for the Reeb flow (`H = 1`). The local flow exists on the open domain
given by the smooth flow theorem; a global flow is asserted only under completeness of `X_H`, which
holds when `M` is compact or `H` has compact support. Conversely, a smooth vector field `X` whose
local flow preserves `ξ` is `X_(α(X))` (Courte–Guillermou, pp. 35–36 and Lemma 3.7).
*Needs:* Tau Ceti `TauCeti.flowOf`, `TauCeti.flowDomain`, `TauCeti.isOpen_flowDomain`,
`TauCeti.contMDiffOn_flowOf`, `TauCeti.hasDerivAt_mpullback_globalFlow`,
`TauCeti.SmoothForm.IsContactHamiltonianVectorField.mlieDerivForm_eq`,
`TauCeti.SmoothForm.IsContactForm.eq_contactHamiltonianVectorField_of_mlieDerivForm_eq_smul`;
DifferentialGeometry Layer 3 (items 3.2, maximal flows, and 3.3, completeness).

**Checks.**
- On `(ℝ³, dz − x dy)`, `X_z = x ∂_x + z ∂_z`, `R_α z = 1`, the flow is
  `φₜ(x, y, z) = (eᵗ x, y, eᵗ z)` and `φₜ^* α = eᵗ α`, matching `gₜ = eᵗ`. With the opposite
  convention `α(X) = −H` the same `H` would give the flow `(e⁻ᵗ x, y, e⁻ᵗ z)` and `gₜ = e⁻ᵗ`.
- `X_1 = R_α = ∂_z` and its flow `(x, y, z + t)` is strict, `gₜ = 1`.

### 2.3 Contactomorphisms

A diffeomorphism `F : M → M'` is a **contactomorphism** of contact distributions when
`dF(ξ) = ξ'`; for forms `α`, `α'` with these kernels this means `F^*α' = g α` with `g` nowhere zero.
It is **coorientation-preserving** for chosen coorientations when `g > 0`, and **strict** for
chosen forms when `F^*α' = α`. Prove that strict implies coorientation-preserving implies
contactomorphism and that both implications are strict; that each class is closed under
composition and inverses; that a contactomorphism `F` with `F^*α' = g α` carries the contact
Hamiltonian vector field of `H'` to that of `(H' ∘ F)/g`, that is `F^* X_(H') = X_((H' ∘ F)/g)`;
and that the flows of §2.2 consist of coorientation-preserving contactomorphisms, strict exactly
when `R_α H = 0` along the orbit.
*Needs:* §2.2; Layer 1 (§1.2 for coorientations); Tau Ceti
`TauCeti.SmoothForm.kerDistribution_mpullback`, `Diffeomorph.isContactForm_mpullback_iff`,
`TauCeti.SmoothForm.IsContactForm.mfderiv_reebVectorField_mpullback`.

**Checks.**
- On `(ℝ³, α = dz − x dy)`: `F(x, y, z) = (2x, y, 2z)` has `F^*α = 2α`, coorientation-preserving and
  not strict (it is the time-`log 2` map of the flow of `X_z`); `G(x, y, z) = (−x, y, −z)` has
  `G^*α = −α`, a contactomorphism reversing the coorientation; `(x, y, z) ↦ (x, y, z + c)` is strict.
- For `F` above, `F^* X_1 = F^* ∂_z = ½ ∂_z = X_(1/2)`, as the transport law predicts with `g = 2`;
  a law without the factor `1/g` would give `∂_z`.

### Examples

- The Reeb field of the sphere form of §1.4 is `w ↦ i w` (Tau Ceti
  `TauCeti.SymplecticForm.mvfderiv_reebVectorField_sphereContactForm` with `K = i/2`, since
  `ω(u, (i/2) v) = ⟪u, v⟫` for `ω = 2 Σⱼ dxⱼ ∧ dyⱼ`), so the Reeb flow is the Hopf flow
  `w ↦ e^(it) w` on `S²ⁿ⁺¹ ⊂ ℂⁿ⁺¹` and every Reeb orbit is closed of period `2π`.
- On `(ℝ³, dz − x dy)`: `X_x = −∂_y`, `X_y = ∂_x + y ∂_z`, `X_z = x ∂_x + z ∂_z`.

### Dependencies

Layer 1. Tau Ceti: the Reeb field, the contact flat map, contact Hamiltonian vector fields, maximal
flows and the Lie derivative along flows. DifferentialGeometry Layer 3.

## Layer 3: Darboux and Gray stability

Tau Ceti supplies the horizontal contact-Moser vector field
(`TauCeti.SmoothForm.contactMoserVectorField`): for a contact form `α` and a one-form `β` it is the
unique `Y ∈ ξ` with `(ι_Y dα + β)|ξ = 0`
(`TauCeti.SmoothForm.IsContactForm.eq_contactMoserVectorField_iff`), smooth, zero exactly where `β`
vanishes on `ξ` (`TauCeti.SmoothForm.IsContactForm.contactMoserVectorField_eq_zero_iff`), satisfying
`L_Y α + β = β(R_α) α`, and unchanged when `(α, β)` is replaced by `(f α, f β + g α)` for any
nowhere-zero `f` (`TauCeti.SmoothForm.IsContactForm.contactMoserVectorField_of_eq_smul`).
Time-dependent flows are `TauCeti.timeDependentFlowOf` on their open domain, which contains every
trajectory through a point where the field vanishes for all times
(`TauCeti.mem_timeDependentFlowDomain_of_forall_eq_zero`).

### 3.1 The contact Darboux theorem for contact structures

Prove `exists_darbouxChart_kerDistribution_eq`: for a smooth contact distribution `ξ` on a
`(2n + 1)`-manifold without boundary and a point `x`, there are an open neighbourhood `U` of `x` and
a smooth map `φ : U → ℝⁿ × ℝⁿ × ℝ`, a diffeomorphism onto an open subset, with
`dφ_y(ξ_y) = ker α_std` at every `y ∈ U`. Given a coorientation of `ξ` on a neighbourhood of `x`,
`φ` can be chosen to carry it to the coorientation of `α_std`; for a local contact form `α` this
reads `φ^*α_std = g α` with `g` nowhere zero, and `g > 0` when the coorientation is fixed
(Courte–Guillermou, Theorem 3.11, p. 37). This is distinct from the symplectic Darboux theorem.
*Route:* take a local contact form, choose at `x` a basis in which `αₓ` and `dαₓ` are standard (Tau
Ceti's linear normal form), join `α` to the pullback of `α_std` by the linear path of forms, contact
on a neighbourhood of `x` because the two forms and their exterior derivatives agree at `x`, solve
the contact-Moser equation along the path, and shrink the chart so that the time-dependent field,
which vanishes at `x`, has its flow defined for all `t ∈ [0, 1]`.
*Needs:* Layer 1; Tau Ceti `TauCeti.IsContactDistribution.exists_isContactFormAt`,
`TauCeti.SmoothForm.IsContactForm.exists_linearEquiv_eq_stdContact`,
`TauCeti.SmoothForm.contactMoserVectorField`, `TauCeti.timeDependentFlowOf`,
`TauCeti.mem_timeDependentFlowDomain_of_forall_eq_zero`; DifferentialGeometry Layer 3 (item 3.5,
time-dependent flows).

**Checks.**
- On `ℝ³` with `ξ = ker(eˣ(dz − x dy))`, the coordinate swap `(x, y, z) ↦ (q, p, z) = (y, x, z)`
  is a Darboux chart for `ξ`: it pulls `α_std` back to `dz − x dy = e⁻ˣ · eˣ(dz − x dy)`,
  with `g = e⁻ˣ > 0`.

### 3.2 The Darboux theorem for contact forms

Prove `exists_darbouxChart_mpullback_eq`: for a contact form `α` on a `(2n + 1)`-manifold without
boundary and a point `x`, there are an open neighbourhood `U` of `x` and a smooth map
`φ : U → ℝⁿ × ℝⁿ × ℝ`, a diffeomorphism onto an open subset, with `φ^*α_std = α` exactly on `U`
(Courte–Guillermou, Theorem 3.12, p. 37; Geiges, Theorem 2.24, pp. 17–18). Such a chart carries
`R_α` to `∂_z`. *Route:* the Reeb flow out of a hypersurface `Σ` through `x` transverse to `R_α`
writes `α = dz + β` near `x`, with `β` a one-form on `Σ` and `dβ` symplectic; the symplectic Darboux
theorem gives coordinates on `Σ` in which `dβ = Σ dqᵢ ∧ dpᵢ`, so `β + Σ pᵢ dqᵢ` is closed, hence
`dh` near `x`, and the coordinate `z + h` absorbs it. The generic form, flow and Moser primitives
come from DifferentialGeometry and HeegaardFloer; the contact-specific algebra is here.
*Needs:* §2.2 (Reeb flow); Tau Ceti `TauCeti.flowOf`,
`TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq` (Darboux for a closed
two-form nondegenerate at a point of a normed space); HeegaardFloer §4.1 (F2.1, Darboux charts on
manifolds); DifferentialGeometry Layer 5 (item 5.4, the homotopy operator, for the local
primitive).

**Checks.**
- For `α = eˣ(dz − x dy)` on `ℝ³` the coordinate swap of §3.1 is a Darboux chart for `ker α` but
  not for `α`: it pulls `α_std` back to `e⁻ˣ α`. A form-level chart must carry
  `R_α = e⁻ˣ(∂_y + (x + 1) ∂_z)` to `∂_z`, while the swap carries it to `e⁻ᵖ(∂_q + (p + 1) ∂_z)`.

### 3.3 Relative Gray stability

Let `M` be a Hausdorff manifold without boundary (second countability is not used) and `K ⊆ M` a
subset. Let `ξₜ`, `t ∈ ℝ`, be hyperplane fields on `M`, jointly smooth: `(t, x) ↦ 0 × ξₜ(x)` is a
smooth distribution of rank `dim M − 1` on `ℝ × M` (`TauCeti.IsContMDiffDistribution`), equivalently
near every point of `ℝ × M` the `ξₜ` are the kernels of one-forms `αₜ` depending smoothly on
`(t, x)`. Assume that for every `t ∈ [0, 1]` the field `ξₜ` is a contact distribution and
`ξₜ(x) = ξ₀(x)` for every `x ∈ K`; no coorientation is assumed, and by continuity the agreement
extends to the closure of `K`. Prove `exists_relative_isotopy_map_mfderiv_eq`: there are an open
`V ⊇ K` and a smooth map `φ : [0, 1] × V → M` with `φ₀ = id`, each `φₜ` a diffeomorphism of `V`
onto an open subset of `M`, `φₜ(x) = x` for `x ∈ K`, and `dφₜ(ξ₀) = ξₜ` on `V`. A family given only
on an open `U ⊇ K` is the case `M = U`, and one given only for `t` in an open interval `T ⊇ [0, 1]`
is reparametrized by a diffeomorphism `ℝ → T` that is the identity on `[0, 1]`. Locally, for
defining forms `αₜ` of `ξₜ`, the identity reads `φₜ^* αₜ = gₜ α₀` with `gₜ` nowhere zero, positive
when the `αₜ` define compatible coorientations (Courte–Guillermou, Theorem 3.9, p. 36, for compact
`K`). *Route:* the set of `(t, x)` at which `ξₜ` is contact is open and contains `[0, 1] × M`. On
it, on a domain of local defining forms `αₜ`, the contact-Moser field `Yₜ` of `(αₜ, ∂ₜ αₜ)` solves
`Yₜ ∈ ξₜ`, `(ι_(Yₜ) dαₜ + ∂ₜ αₜ)|ξₜ = 0`; replacing `αₜ` by `fₜ αₜ` replaces `∂ₜ αₜ` by
`fₜ ∂ₜ αₜ + (∂ₜ fₜ) αₜ` and leaves `Yₜ` unchanged for every nowhere-zero `fₜ`, of either sign, so the
local fields glue to a smooth time-dependent field on that open set without a global form or an
oriented contact line. On `K`, for `t ∈ [0, 1]`, `∂ₜ αₜ` is a multiple of `α₀`, so `Yₜ` vanishes
there; each trajectory through `K` is stationary and exists on `[0, 1]`, and openness of the
time-dependent flow domain gives `V`, with no compactness of `K` and no uniform width.
*Needs:* Layer 1 (§1.2 for local forms and transition functions); Tau Ceti
`TauCeti.IsContMDiffDistribution`, `TauCeti.IsContactDistribution`,
`TauCeti.SmoothForm.contactMoserVectorField`,
`TauCeti.SmoothForm.IsContactForm.contactMoserVectorField_of_eq_smul`,
`TauCeti.SmoothForm.IsContactForm.contactMoserVectorField_eq_zero_iff`,
`TauCeti.SmoothForm.IsContactForm.mlieDerivForm_contactMoserVectorField_add`,
`TauCeti.timeDependentFlowOf`, `TauCeti.mem_timeDependentFlowDomain_of_forall_eq_zero`;
DifferentialGeometry Layer 3 (item 3.5) and Layer 1 (item 1.4, Cartan calculus).

**Checks.**
- If `ξₜ = ξ₀` for all `t`, then `∂ₜ αₜ` is a multiple of `αₜ`, the Moser field vanishes
  everywhere and `φₜ = id`.

### 3.4 Gray stability on closed manifolds

When `M` is a closed manifold, the field of §3.3 is defined on all of `M` for `t` near `[0, 1]`,
and its time-dependent flow is complete. Prove `exists_diffeotopy_map_mfderiv_eq`: a family `ξₜ`,
`t ∈ ℝ`, jointly smooth as in §3.3 and contact for `t ∈ [0, 1]`, is induced by a diffeotopy `Φ` of
`M` (`TauCeti.Diffeotopy`), `dΦₜ(ξ₀) = ξₜ` for every `t ∈ [0, 1]`, with no coorientation
(Courte–Guillermou, Theorem 3.10, p. 37). Prove `exists_diffeotopy_mpullback_eq_pos_smul`, the
statement for a smooth family of contact forms `αₜ`, given as the restrictions to the slices
`{t} × M` of one smooth one-form on `ℝ × M`: there are a diffeotopy `Φ` and a positive function `g`
with `Φₜ^* αₜ = gₜ α₀` for every `t ∈ [0, 1]` (Geiges, Theorem 2.20 and its proof, pp. 14–15).
*Needs:* §3.3; Tau Ceti `TauCeti.IsContMDiffDistribution`, `TauCeti.IsContactDistribution`,
`TauCeti.Diffeotopy`, `TauCeti.timeDependentFlowOf`;
DifferentialGeometry Layer 3 (items 3.3, completeness on compact manifolds, and 3.5).

**Checks.**
- For `αₜ = (1 + t) α₀` on a closed manifold the kernel is constant, `Φₜ = id` and `gₜ = 1 + t`. The
  stronger conclusion `Φ₁^* α₁ = α₀` is impossible here: the contact volume `∫ α ∧ (dα)ⁿ` is
  nonzero, unchanged up to sign by a diffeomorphism, and multiplied by `2ⁿ⁺¹` when `α` is doubled.
  Gray stability is a statement about distributions, and about forms only up to a positive
  multiplier.

### Examples

- On `S³ ⊂ ℂ²` with the sphere form `α₀`, the family `αₜ = α₀ + t ε β`, for any one-form `β` and
  `ε` small enough that `αₜ ∧ dαₜ` stays nowhere zero for `t ∈ [0, 1]`, is carried to `α₀` up to a
  positive multiplier by a diffeotopy.

### Dependencies

Layers 1 and 2. Tau Ceti: the linear normal form, the contact-Moser vector field, time-dependent
flows, diffeotopies and the symplectic Darboux theorem on normed spaces. DifferentialGeometry
Layers 1, 3 and 5. HeegaardFloer §4.1.

<a id="cg4--symplectization-and-contactization"></a>

## Layer 4: symplectization and contactization

Tau Ceti supplies the cooriented symplectization: for a one-form `α` on `M`, the form `eᵗ α` on
`ℝ × M` (`TauCeti.SmoothForm.symplectization`), whose exterior derivative is symplectic exactly
when `α` is a contact form (`TauCeti.SmoothForm.isSymplectic_mextDerivₗ_symplectization_iff`), with
Liouville field `∂_t` (`TauCeti.SmoothForm.isLiouvilleVectorField_symplectization`); the lift
`(t, x) ↦ (t − log f(x), F(x))` of a map with `F^*α' = f α`, `f > 0` (`TauCeti.symplectizationLift`),
which pulls `eᵗ α'` back to `eᵗ α` (`TauCeti.SmoothForm.mpullback_symplectizationLift_symplectization`);
hypersurfaces of contact type (`TauCeti.IsContactType`, `TauCeti.IsRestrictedContactType`) and the
contact form they carry (`TauCeti.IsContactType.isContactForm_mpullback`); the identity
`L_Z λ = λ` for the Liouville field of a primitive (`TauCeti.mlieDerivForm_eq_self_of_interior_eq`)
and, for a complete Liouville field, the flow-out identity
`TauCeti.mpullback_globalFlow_comp_eq_symplectization`; and the contactization
(`TauCeti.SmoothForm.contactization`).

### 4.1 The symplectization of a contact structure

Let `L` be the contact line of a contact distribution `ξ` (§1.1) and `π : L* ∖ 0 → M` the
complement of the zero section in its dual. Define the homogeneous tautological one-form `θ` on
`L* ∖ 0` by `θ_(x, ℓ)(v) = ℓ([dπ(v)])`, with `[dπ(v)]` the class of `dπ(v)` in `Tₓ M/ξₓ`. Prove that
`ω = dθ` is a symplectic form, by the Levi nondegeneracy calculation, and that the fibrewise
multiplication by `eˢ` pulls `θ` back to `eˢ θ`. Set `λ = −θ`, so that `ω = dθ = −dλ` agrees with
the SymplecticGeometry convention. A contact form `α` with kernel `ξ` identifies the component of
`L* ∖ 0` on which `ℓ` is a positive multiple of `α` with `ℝ × M`, `(t, x) ↦ eᵗ αₓ`, carrying `θ` to
Tau Ceti's `eᵗ α`; the trivialized `ℝ × M` is thus the cooriented case, and the full `L* ∖ 0`
contains both components of a coorientable `ξ` and is connected for a noncoorientable `ξ` on a
connected manifold.
*Needs:* §1.1, §1.2; Tau Ceti `TauCeti.SmoothForm.symplectization`,
`TauCeti.SmoothForm.isSymplectic_mextDerivₗ_symplectization_iff`, `TauCeti.SmoothTwoForm.IsSymplectic`;
SmoothBundlesConnections §B2.1 (dual bundle).

**Checks.**
- For the space of contact elements `M = ℝ² × ℝP¹` of §1.2, `ξ⁰ ∖ 0` consists of the covectors
  `p₁ dx + p₂ dy` with `(p₁, p₂) ≠ 0` parallel to `(cos τ, sin τ)`, so `L* ∖ 0 ≅ ξ⁰ ∖ 0` is
  identified with `T*ℝ² ∖ 0`, connected, and `θ` becomes the Liouville form `p₁ dx + p₂ dy`. No
  `ℝ × M` trivialization exists, since `ξ` has no global contact form.
- For `ξ` coorientable, `L* ∖ 0` has two components, exchanged by `ℓ ↦ −ℓ`, which pulls `θ` back to
  `−θ`.

### 4.2 Lifts of contactomorphisms

A contactomorphism `F : (M, ξ) → (M', ξ')` induces the isomorphism `L → F*L'` of contact lines and,
by its inverse transpose, a map `F̃ : L* ∖ 0 → L'* ∖ 0` covering `F`. Prove that `F̃` is the unique
map covering `F` that pulls `θ'` back to `θ`; in particular it is an exact symplectomorphism, also
when `F` reverses a coorientation, and `F ↦ F̃` is compatible with composition. For cooriented data
with `F^*α' = f α`, `f > 0`, prove that `F̃` is, on the positive components, Tau Ceti's lift
`(t, x) ↦ (t − log f(x), F(x))` (`TauCeti.symplectizationLift`), the unique lift preserving
`θ = eᵗ α` (equivalently `λ = −eᵗ α`). It is not an arbitrary translation in `t`: composing with
`t ↦ t + c` multiplies `θ` by `e^c`, so for `c ≠ 0` it no longer preserves `θ`.
*Needs:* §4.1, §2.3; Tau Ceti `TauCeti.symplectizationLift`,
`TauCeti.SmoothForm.mpullback_symplectizationLift_symplectization`.

**Checks.**
- For `G(x, y, z) = (−x, y, −z)` on `(ℝ³, dz − x dy)`, `G^*α = −α`; `G̃` exchanges the two
  components of `L* ∖ 0` and preserves `θ`, while no map of the form `(t, x) ↦ (t + c(x), G(x))`
  preserves `eᵗ α`.

### 4.3 Liouville fields and collars of contact-type hypersurfaces

For an exact symplectic manifold `(W, ω = −dλ)` with Liouville field `Z`, `ι_Z ω = −λ`, and an
embedded hypersurface `Y` transverse to `Z`, the restriction `α = −λ|Y` is a contact form (Tau Ceti
`TauCeti.IsContactType.isContactForm_mpullback`, with `L_Z λ = λ` from
`TauCeti.mlieDerivForm_eq_self_of_interior_eq`). Prove the collar theorem with the local flow: on an
open neighbourhood of `{0} × Y` in `ℝ × Y` contained in the flow domain, the map
`Φ(s, y) = φ_Z^s(y)` is a diffeomorphism onto an open neighbourhood of `Y` with `Φ^*(−λ) = eˢ α` and
`Φ^*ω = d(eˢ α)`; the identity `L_Z λ = λ` along the flow fixes both signs. For noncompact `Y` the
domain is open with variable collar width; a collar of uniform width `(−ε, ε) × Y` is asserted only
when `Y` is compact, or when `Φ` is defined and injective on `(−ε, ε) × Y`; completeness of `Z` does
not give it. For a complete `Z` the form identity is Tau Ceti's
`TauCeti.mpullback_globalFlow_comp_eq_symplectization`. Under DGFloer's convention `ω = dλ_D`,
`ι_Z ω = λ_D`, the primitive is `λ_D = −λ`, and its boundary form `λ_D|Y` is the `α` above.
*Needs:* §4.1 (for the comparison with the symplectization); Tau Ceti `TauCeti.IsContactType`,
`TauCeti.IsContactType.isContactForm_mpullback`, `TauCeti.mlieDerivForm_eq_self_of_interior_eq`,
`TauCeti.mpullback_globalFlow_comp_eq_symplectization`, `TauCeti.flowOf`, `TauCeti.flowDomain`;
DifferentialGeometry Layer 3 (item 3.2).

**Checks.**
- In `ℝ²ⁿ⁺²` with `ω = 2 Σ dxⱼ ∧ dyⱼ`, the primitive `λ_u(v) = −½ ω(u, v)` has `ω = −dλ`, Liouville
  field `Z(u) = u/2` and `α = −λ|S²ⁿ⁺¹ = Σ (xⱼ dyⱼ − yⱼ dxⱼ)`, the sphere form of §1.4. The collar
  `Φ(s, y) = e^(s/2) y` is a diffeomorphism of `ℝ × S²ⁿ⁺¹` onto `ℝ²ⁿ⁺² ∖ 0`, and since `λ` is
  homogeneous of degree two, `Φ^*(−λ) = eˢ α`. With `Z(u) = u` the collar would be `eˢ y` and give
  `e^(2s) α`.
- In `ℝ² ∖ 0` with the complete field `Z(u) = u/2`, let `Y` be the spiral `r = ρ(θ)`, `θ ∈ ℝ`, with
  `ρ′ > 0`, `ρ → 0` as `θ → −∞` and `ρ(θ) = θ` for `θ ≥ 3`: a closed embedded curve transverse to
  `Z`. For `θ ≥ 3` the points of `Y` at angles `θ` and `θ + 2π` lie on one ray and are joined by the
  flow in time `2 log(1 + 2π/θ)`, which tends to `0`, so `Φ` is injective on no `(−ε, ε) × Y`.

### 4.4 Contactization

For an exact symplectic manifold `(W, ω = −dλ)`, the contactization `W × ℝ` with `α = dz − λ` has
`dα = ω` pulled back and is a contact form (Tau Ceti `TauCeti.SmoothForm.contactization`,
`TauCeti.SmoothForm.mextDerivₗ_contactization`, `TauCeti.SmoothForm.isContactForm_contactization_iff`);
for `W = T*Q` with its Liouville form this is the one-jet space `J¹Q = T*Q × ℝ` with `dz − λ_Q`
(`TauCeti.CotangentBundle.isContactForm_contactization_liouvilleForm`); and replacing `λ` by
`λ + dh` corresponds to the change of coordinate `z ↦ z − h` (`TauCeti.contactizationShift`,
`TauCeti.mpullback_contactizationShift_contactization`). Prove the contact volume formula
`α ∧ (dα)ⁿ = dz ∧ ωⁿ` on `W × ℝ`, `dim W = 2n`, so that the contact volume vanishes nowhere.
*Needs:* §1.3; Tau Ceti `TauCeti.SmoothForm.contactization`,
`TauCeti.SmoothForm.mextDerivₗ_contactization`.

**Checks.**
- For `W = ℝ²` with `λ = p dq`, `α = dz − p dq` and `α ∧ dα = dz ∧ dq ∧ dp = dz ∧ ω` with
  `ω = −dλ = dq ∧ dp`; the sign of `ω` is the one that makes the volume formula hold with `+`.

### Examples

- The symplectization of `(S²ⁿ⁺¹, α)` is `ℝ²ⁿ⁺² ∖ 0` with `ω = 2 Σ dxⱼ ∧ dyⱼ`, through the collar of
  §4.3.
- `J¹ℝ = T*ℝ × ℝ` with `dz − p dq` is `(ℝ³, α_std)`.

### Dependencies

Layers 1 and 2. Tau Ceti: the cooriented symplectization and its lift, Liouville fields and
contact-type hypersurfaces, flows, the contactization and the one-jet space. DifferentialGeometry
Layer 3. SmoothBundlesConnections §B2.1.

<a id="cg5--isotropic-and-legendrian-neighborhoods"></a>

## Layer 5: isotropic and Legendrian neighbourhoods

### 5.1 Isotropic submanifolds and the conformal symplectic normal bundle

An immersed submanifold `i : N → M` is **isotropic** when `di(TN) ⊆ ξ`. Prove that the Levi form
then vanishes on `TN`, by pulling back a local defining form and its exterior derivative
(`i^*α = 0` gives `i^* dα = 0`), and that `dim N ≤ n`. Define the **conformal symplectic normal
bundle** `CSN(N) = (TN)^⊥_L / TN`, where `(TN)^⊥_L ⊂ ξ|N` is the `L`-valued Levi orthogonal of
`TN`, as a smooth vector bundle of rank `2(n − dim N)` over `N` carrying the nondegenerate
`L|N`-valued form induced by `L_ξ`; build it from local defining forms and prove its independence
of them through the transition laws of §1.2 (for cooriented `ξ`, Geiges, §2.4.2, pp. 19–20; for
`dim N ≤ n`, Courte–Guillermou, Proposition 3.5, p. 35).
*Needs:* §1.1, §1.2; Tau Ceti `TauCeti.distributionLeviForm`, `TauCeti.SmoothForm.mpullback`;
Mathlib `Manifold.IsImmersion`; SmoothBundlesConnections §B2.1.

- For `N` a point, `CSN(N) = ξₓ` with the Levi form; for a Legendrian `N`, `dim N = n` and
  `CSN(N) = 0`.
- A contactomorphism between neighbourhoods carrying `N` onto `N'` induces an isomorphism of
  contact lines along `N` and a conformally symplectic isomorphism `CSN(N) → CSN(N')`, compatibly
  with composition.

**Checks.**
- In `(ℝ³, dz − x dy)` no surface is tangent to `ξ` (`dim N ≤ 1`), consistent with
  DifferentialGeometry's no-integral-surface example; a curve tangent to `ξ` has `CSN = 0`.

### 5.2 The isotropic neighbourhood theorem

Prove: let `N ⊂ M` and `N' ⊂ M'` be closed embedded isotropic submanifolds, `ψ : N → N'` a
diffeomorphism, `ψ_L : L|N ≅ ψ*(L'|N')` an isomorphism of contact lines and `Ψ : CSN(N) → CSN(N')` a
bundle isomorphism over `ψ` that is conformally symplectic with respect to `ψ_L`. Then `ψ` extends
to a contactomorphism of neighbourhood germs of `N` and `N'` inducing `ψ_L` on contact lines and
`Ψ` on conformal symplectic normal bundles. For compact `N` in a cooriented `ξ` Geiges proves the
extension with an induced map on conformal symplectic normal bundles that is only bundle homotopic
to `Ψ` (Geiges, Theorem 2.27, p. 21); the form stated here, for closed and possibly noncompact `N`,
a possibly nontrivial contact line and `Ψ` realized exactly, is proved by the route below.
*Route.* Build the full first-order identification of `TM|N` with `TM'|N'` from `ψ`, `ψ_L` and `Ψ`
and realize it by a tubular embedding (GeometricTopology §1.5). Extend `ψ_L` from `N` to the
tubular neighbourhoods by bundle transport along the normal fibres (SmoothBundlesConnections
§B5.0), so the two quotient forms are compared in one line bundle; choose complements so that their
full values and line-valued Levi forms agree along `N`. Their affine interpolation is contact on a
neighbourhood of `N` for all `t ∈ [0, 1]`, and §3.3 gives a first germ fixing `N` and its contact
line, whose induced normal map is only homotopic to `Ψ`. Then realize `Ψ` exactly by an additional
contact flow. On the source bundle `S = CSN(N)`, let `Aₜ` be the normal map induced by the Gray
isotopy after the initial identification: the full-value and Levi agreement makes `Aₜ` symplectic
for the fixed contact-line identification, with `A₀ = id`. Set `Bₜ = Aₜ⁻¹` and
`Kₜ = (∂ₜ Bₜ) Bₜ⁻¹`, infinitesimally symplectic. The line-valued quadratic Hamiltonian
`Hₜ(s) = −½ L_ξ(Kₜ s, s)` has Hessian `−L_ξ(Kₜ v, w)`; extend it to a tubular neighbourhood using a
bundle complement, with value and first derivative zero on `N`. Its contact Hamiltonian vector
field (Layer 2) vanishes on `N` and induces `Kₜ` on `S`, by differentiating
`ι_(X_H) dα = (R_α H) α − dH` along `N`; its flow fixes the contact line and has normal map `Bₜ`.
The line-valued construction glues in noncooriented charts. The trajectories along `N` are
stationary and the flow domain is open, so the flow exists to time `1` on a neighbourhood of `N`
without compactness. Composing this correcting flow on the source with the first germ gives
exactly `Ψ`. The germ existence statement is independent of the auxiliary complements.
*Needs:* §5.1; §3.3; §2.2; GeometricTopology §1.5 (Tau Ceti
`TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`); SmoothBundlesConnections §B5.0
(transport in a vector bundle); DifferentialGeometry Layer 3 (item 3.5).

**Checks.**
- For `N` a point the theorem is the Darboux theorem of §3.1: `CSN = ξₓ`, and any two linear
  conformal symplectic identifications are realized.
- For a Legendrian `N`, `CSN = 0` and the data are `ψ` and `ψ_L` alone.

### 5.3 Legendrian submanifolds and one-jet spaces

A **Legendrian immersion** of an `n`-manifold `Λ` into `(M²ⁿ⁺¹, ξ)` is an immersion with
`dι(TΛ) ⊆ ξ`, equivalently with `ι^*α = 0` for every local defining form `α`; a **Legendrian
submanifold** is the image of a Legendrian embedding. Prove that in `J¹Q = T*Q × ℝ` with
`dz − λ_Q` the one-jet `j¹f(q) = (df_q, f(q))` of a smooth function is a Legendrian embedding, and
the graph criterion: the image of a section `q ↦ (σ(q), u(q))` of `J¹Q → Q` is Legendrian if and only
if `σ = du`, so the Legendrian sections are exactly the one-jets of functions (the contact lift of
`u`) (Courte–Guillermou, p. 35; Kriegl–Michor, 43.17, p. 472).
*Needs:* §5.1; Tau Ceti `TauCeti.SmoothForm.contactization`, `TauCeti.CotangentBundle.liouvilleForm`,
`TauCeti.CotangentBundle.mpullback_liouvilleForm` (the Liouville form pulls back along the section
of a one-form to that form); Mathlib `Manifold.IsSmoothEmbedding`.

**Checks.**
- The zero section `{p = 0, z = 0}` of `J¹Q` is Legendrian; the section `q ↦ (0, u(q))` with `u`
  nonconstant is not, since `dz − λ` pulls back to `du ≠ 0`.
- In `(ℝ³, dz − x dy)` the `y`-axis `{x = z = 0}` is Legendrian.

### 5.4 The strict Legendrian neighbourhood theorem

Prove `exists_mpullback_eq_contactization_of_isLegendrian`: let `α` be a contact form on a
`(2n + 1)`-manifold `M` and `ι : Λ → M` a Legendrian embedding of an `n`-manifold, its image closed
or not. Then there are an open neighbourhood `U` of the zero section of `T*Λ × ℝ` and a map
`φ : U → M`, a diffeomorphism onto an open neighbourhood of `ι(Λ)`, with `φ(0_q, 0) = ι(q)` and
`φ^*α = dz − λ_Λ` exactly, `λ_Λ` the Liouville form of `T*Λ` (Kriegl–Michor, §43, Proposition 43.18,
pp. 472–473). This is a strict contactomorphism for the chosen forms, not only a contactomorphism of
their kernels; the contact-structure argument of §3.3 alone gives only `φ^*α = g (dz − λ_Λ)` with
`g` nowhere zero, positive when coorientations are preserved, which is not equivalent. Compact `Λ`
is a special case, and closedness of the image is not assumed: an embedded submanifold is closed in
some open neighbourhood `W` of itself, and the route below runs in `W`. Kriegl–Michor's model
`θ_Λ − dt` is carried to `dz − λ_Λ` by reversing both the cotangent-fibre and the real coordinate.
*Route* (Kriegl–Michor, Proposition 43.18). After identifying the full first-order contact data
along `Λ` by a tubular embedding, arrange the two forms to have the same value and exterior
derivative on the full ambient tangent bundle along the zero section; interpolate
`αₜ = (1 − t) α₀ + t α₁` on a neighbourhood small enough that every `αₜ` is contact; solve
`ι_(Xₜ) dαₜ + d(αₜ(Xₜ)) = α₀ − α₁` by solving the scalar Reeb-direction equation
`dhₜ(Rₜ) = (α₀ − α₁)(Rₜ)` for `hₜ = αₜ(Xₜ)` on a transverse slice with zero initial values and then
inverting `X ↦ ι_X dαₜ + αₜ(X) αₜ` (Tau Ceti's contact flat map); the strict Moser field `Xₜ`
vanishes on `Λ`, the flow exists to time `1` on a neighbourhood of `Λ` because the trajectories
along `Λ` are stationary and the flow domain is open, and the time-one map gives `φ`.
*Needs:* §5.3; §2.2; Tau Ceti `TauCeti.SmoothForm.IsContactForm.isInvertible_contactFlat`,
`TauCeti.CotangentBundle.isContactForm_contactization_liouvilleForm`,
`TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`, `TauCeti.timeDependentFlowOf`,
`TauCeti.mem_timeDependentFlowDomain_of_forall_eq_zero`; GeometricTopology §1.5.

**Checks.**
- For the `y`-axis in `(ℝ³, dz − x dy)`, `(q, p, z) ↦ (p, q, z)` is a global strict
  contactomorphism from `(J¹ℝ, dz − p dq)` fixing the zero section onto the axis; the map
  `(q, p, z) ↦ (−p, q, z)` pulls `dz − x dy` back to `dz + p dq` and is not strict for these
  forms.
- For `α' = eˣ(dz − x dy)` and the same axis, the first map pulls `α'` back to `eᵖ(dz − p dq)`, a
  contactomorphism of kernels that is not strict; the theorem gives a different `φ` with
  `φ^*α' = dz − p dq`.

### 5.5 The twisted one-jet model and Legendrians with nontrivial contact line

For a closed embedded Legendrian `Λ` whose contact line `L|Λ` may be nontrivial, use the
vector-bundle first jets `J¹(L|Λ)` with their transition and projection laws from
PseudodifferentialOperators P1.0, specialized to a real line bundle. A connection `∇` on `L|Λ`
(SmoothBundlesConnections §B3.3) splits `J¹(L|Λ) ≅ (L|Λ) ⊕ (T*Λ ⊗ L|Λ)` by
PseudodifferentialOperators P1.0's connection splitting, and a change of connection changes the
splitting by the difference-of-connections law. Let `z` and `p` be the tautological fibre sections.
Prove that the `L`-valued one-form `θ = ∇z − p`, with `p` evaluated on the base projection, defines
a hyperplane field near the zero section whose Levi pairing along the zero section is the
tautological pairing between `TΛ` and `T*Λ ⊗ L`; that it is contact near the zero section; that its
transition maps are those of `J¹(L|Λ)`; that changing `∇` gives contactomorphic germs, explicitly by
the fibre shift in `p` induced by the difference of the two connections; and that in a
trivialization with flat connection it is `dz − Σ pᵢ dqᵢ`. Then prove the neighbourhood theorem: a
closed embedded Legendrian `Λ ⊂ (M, ξ)` has a neighbourhood germ contactomorphic to that of the zero
section in this model, by a contactomorphism of hyperplane germs inducing the given identification
of contact lines along `Λ`, under which the canonical line-valued quotient forms correspond through
the induced line bundle map. The strict theorem of §5.4 additionally fixes a contact form; its
untwisted model is the trivial-line case. For compact `Λ` and a contact form defined near `Λ`, the
germ statement is Courte–Guillermou, Theorem 3.13, p. 38. For noncompact `Λ` the neighbourhoods are
germs along `Λ` with no uniform width, obtained from a tubular germ and the open flow domain as in
§3.3.
*Needs:* §5.2 (or §3.3 directly); §1.1; PseudodifferentialOperators P1.0 (first jets of a vector
bundle, connection splitting, difference law); SmoothBundlesConnections §B3.3 (connections) and
§B5.0 (transport); GeometricTopology §1.5.

**Checks.**
- For `L|Λ` trivial with the trivial connection `d`, `θ = dz − p` is `dz − Σ pᵢ dqᵢ` in local
  coordinates, the model of §5.4.
- For `L|Λ` trivial and the connection `∇ = d + a`, `a` a one-form on `Λ`, the form is
  `θ_∇ = dz + z a − p`, and the fibre shift `(q, p, z) ↦ (q, p − z a(q), z)` pulls `θ_d = dz − p` back
  to `θ_∇` exactly. Shifting by `+z a` instead would give `dz − z a − p`, the model of `d − a`.

### 5.6 Unit cosphere bundles and unit conormals

Consume the Liouville form of CotangentLagrangian Layer 1 (C1) and, from its §2.2 (C2.2), the unit
cosphere bundle `TauCeti.CotangentBundle.cosphereBundle` of a Riemannian manifold `Q` with its two
signed contact forms, `α_b = −λ_can|S*Q`
(`TauCeti.CotangentBundle.isContactForm_mpullback_neg_liouvilleForm_cosphereBundle`) and
`α_g = +λ_can|S*Q = −α_b`
(`TauCeti.CotangentBundle.isContactForm_mpullback_liouvilleForm_cosphereBundle`), and the radial
identification `Diffeomorph.cosphereRadial` for a change of metric, which pulls each form back to a
positive multiple of itself (`Diffeomorph.pos_mpullback_cosphereRadial_neg_liouvilleForm_iff`).
Prove that the radial identification preserves the contact line and its coorientation in the sense
of §1.2. For an embedded submanifold `S ⊂ Q` of positive codimension, prove that its unit conormal
`N*S ∩ S*Q` is an embedded Legendrian submanifold for both `α_b` and `α_g`, from `λ_can|N*S = 0`
(CotangentLagrangian §2.2 (C2.2), Tau Ceti
`TauCeti.CotangentBundle.mpullback_liouvilleForm_eq_zero_of_conormal`) and the dimension count
`dim(N*S ∩ S*Q) = dim Q − 1`. For embeddedness: the radial field is tangent to the conic `N*S` and
transverse to `S*Q`, so the intersection is transverse; it is closed in `S*Q` when `S` is closed in
`Q`, and an embedded `S` that is not closed need not give a closed unit conormal. For the canonical
symplectic convention use the boundary form `α_b` of CotangentLagrangian §2.2: on the component of
the punctured contact line on which `ℓ` is a positive multiple of `α_b`, `θ = r α_b` and the radial
map `(r, z) ↦ r z` pulls `ω_can` back to `dθ`. For `α_g` the same radial map pulls `ω_can` back to
`−d(r α_g)`; it is anti-symplectic for `d(r α_g)`. The full punctured contact line keeps both
components, and the radial symplectomorphism uses the chosen positive one. The construction of
CotangentLagrangian §2.2 is consumed, not repeated.
*Needs:* §1.2, §4.1, §5.3; CotangentLagrangian Layer 1 (C1) and §2.2 (C2.2); Tau Ceti
`TauCeti.CotangentBundle.cosphereBundle`, `Diffeomorph.cosphereRadial`,
`TauCeti.CotangentBundle.mpullback_liouvilleForm_eq_zero_of_conormal`.

**Checks.**
- For `Q = ℝ²` and `S` a point, the unit conormal is the fibre circle `S*_xℝ²`, Legendrian of
  dimension `1 = dim Q − 1`; for `S` a line, it is two copies of the line, one for each unit
  normal covector.
- For `S = Q` (codimension zero) the conormal is the zero section, which does not meet `S*Q`.

### Examples

- The fibres of `S*Q → Q` are Legendrian spheres for `α_b`: the unit conormals of the points.
- A Legendrian immersion `t ↦ (q, p, z)` of an interval into `(ℝ³, dz − p dq)` satisfies
  `z′ = p q′`, so where `q′ ≠ 0` it is determined by its front `t ↦ (q, z)`, its projection to the
  `(q, z)`-plane: `p = z′/q′`, and where the front is the graph of `z = f(q)` the curve is `j¹f`,
  with `p = f′(q)`. A curve whose front is an immersion outside a discrete set of times is therefore
  determined by its front, `p` extending by continuity (Geiges, Lemma 2.45, p. 38, in the
  coordinates `(x, y) = (−p, q)`). Without that condition it is not: `t ↦ (0, t, 0)` and
  `t ↦ (0, 2t, 0)`, `t ∈ (0, 1)`, have the same one-point front.

### Dependencies

Layers 1 to 4. Tau Ceti: tubular neighbourhoods, the one-jet form, the Liouville form, the cosphere
bundle and its radial identification, conormal vanishing of the Liouville form, the contact flat
map and time-dependent flows. GeometricTopology §1.5. SmoothBundlesConnections §§B2.1, B3.3 and
B5.0. PseudodifferentialOperators P1.0. CotangentLagrangian Layer 1 (C1) and §2.2 (C2.2).
DifferentialGeometry Layer 3.

<a id="cg6--contactjacobi-interface-floer-boundary"></a>

## Layer 6: the Jacobi bracket and the Floer boundary interface

### 6.1 The Jacobi bracket of a contact form

For a contact form `α`, with the convention of Layer 2 for contact Hamiltonian vector fields,
define `jacobiBracket`, `{f, g}_α = dα(X_f, X_g) + f R_α(g) − g R_α(f)`. Prove that it equals
`α([X_f, X_g])`, that it is a Jacobi bracket (skew-symmetric, a first-order differential operator
in each argument with `{f, gh} = g{f, h} + h{f, g} − gh{f, 1}`, and satisfying the Jacobi
identity, `jacobiBracket_jacobi`), and that `X_({f, g}) = [X_f, X_g]`
(`contactHamiltonianVectorField_jacobiBracket`), so that `f ↦ X_f` is an isomorphism of Lie
algebras from smooth functions with `{·, ·}_α` onto contact vector fields. The bracket is obtained
directly from the contact vector fields, without a general theory of Jacobi manifolds.
*Needs:* Layer 2; Tau Ceti `TauCeti.SmoothForm.contactHamiltonianVectorField`,
`TauCeti.SmoothForm.IsContactForm.isContactHamiltonianVectorField_iff_mlieDerivForm`,
`TauCeti.SmoothForm.IsContactForm.eq_contactHamiltonianVectorField_of_mlieDerivForm_eq_smul`,
`TauCeti.mlieDerivForm_eq_interior_mextDeriv_add`; Mathlib `VectorField.mlieBracket` and its Jacobi
identity.

- `{1, g}_α = R_α(g)` and `{f, c}_α = −c R_α(f)` for a constant `c`.
- For a strict contactomorphism `F`, `{f ∘ F, g ∘ F}_α = {f, g}_(α') ∘ F`.

**Checks.**
- On `(ℝ³, dz − x dy)`, with `X_x = −∂_y`, `X_y = ∂_x + y ∂_z` and `X_z = x ∂_x + z ∂_z`:
  `{x, y} = −1`, `{y, z} = y`, `{z, x} = 0`, and `[X_x, X_y] = −∂_z = X_(−1)`. A bracket with the
  opposite sign on the `dα` term would give `{x, y} = +1`, whose vector field `∂_z` is not
  `[X_x, X_y]`.
- The Jacobi identity on the coordinates: `{x, {y, z}} + {y, {z, x}} + {z, {x, y}} = −1 + 0 + 1 = 0`.

### 6.2 The bracket on sections of the contact line

For a contact distribution `ξ` without a chosen form, replace functions by smooth sections of the
contact line `L`. A local contact form `α` trivializes `L`, a section `s` being represented by the
function `α(s)`. Prove the transition law: for `α' = h α` with `h` nowhere zero, the section
represented by `f` for `α` is represented by `h f` for `α'`, the contact Hamiltonian vector fields
agree, `X^(α')_(hf) = X^α_f`, and `{h f, h g}_(α') = h {f, g}_α`; so the local brackets glue to a
bracket on smooth sections of `L`, with no coorientation. Prove that `X ↦ X mod ξ` identifies
contact vector fields with smooth sections of `L` (Courte–Guillermou, Remark 3.8, p. 36), carrying
the Lie bracket to this bracket, and that the bracket is a Lie bracket given by a bidifferential
operator of order one in each argument.
*Needs:* §6.1; §1.1, §1.2.

**Checks.**
- For `α' = 2α` on `(ℝ³, dz − x dy)`, the vector field `X_x = −∂_y` has `α'(X_x) = 2x`, so it is
  represented by `2x` for `α'`; `{2x, 2y}_(α') = dα'(X_x, X_y) = −2 = 2{x, y}_α`. The rule
  `f ↦ f/h` would represent it by `x/2`, whose `α'`-Hamiltonian field is `−¼ ∂_y ≠ X_x`.

### 6.3 Comparison with the symplectization

On the positive component of the symplectization trivialized by a contact form, with fibre
coordinate `r = eᵗ > 0` and `ω = d(r α)`, use the SymplecticGeometry conventions `ι_(X_F) ω = dF`
and `{F, G}_ω = ω(X_F, X_G)`. Prove `X_(rf) = r (R_α f) ∂_r − X_f`, in particular `X_r = −R_α`, and
`{r f, r g}_ω = r {f, g}_α`. Prove that the functions on `L* ∖ 0` that are linear on the fibres,
`F(x, c ℓ) = c F(x, ℓ)` for every real `c ≠ 0`, are exactly the functions `ℓ ↦ ℓ(s)` for smooth
sections `s` of `L` (in a trivialization by `α`, the section with `α(s) = f` gives `r f`), that their
Poisson brackets are again of this form, and that the resulting bracket on sections of `L` is the
bracket of §6.2, independently of the trivialization.
*Needs:* §6.1, §6.2, §4.1.

**Checks.**
- `ι_(−R_α)(dr ∧ α + r dα) = dr`, so `X_r = −R_α`; with `{f, g}_α` as in §6.1, the identity
  `{r f, r g}_ω = r(f R_α g − df(X_g)) = r{f, g}_α` uses `df(X_g) = g R_α f − dα(X_f, X_g)`. A
  convention `ω = −d(r α)` would give `X_r = R_α` and `{r f, r g}_ω = −r {f, g}_α`.

### 6.4 The Liouville boundary interface

For a hypersurface of contact type in an exact symplectic manifold, the contact form of §4.3 and
the collar of §4.3 are the interface offered to Floer-theoretic boundary constructions. Prove the
sign adapter to DGFloer's conventions: with `ω = dλ_D` and `ι_Z ω = λ_D`, `λ_D = −λ`, the boundary
contact form `λ_D|Y` is the form `α = −λ|Y` of §4.3, its Reeb field is the same, and the collar
identity reads `Φ^* λ_D = eˢ α`. On cotangent examples the boundary form is `−λ_can|S*Q = α_b`, as in
CotangentLagrangian §2.2 (C2.2).
*Needs:* §4.3, §5.6; DGFloer (standing conventions, sign dictionary).

**Checks.**
- For the unit codisc bundle `D*Q`, DGFloer's primitive is `λ_D = −λ_can` and the boundary form is
  `α_b`; the boundary form `+λ_can|S*Q` would have the opposite Reeb field.

### Examples

- On `(ℝ³, dz − x dy)`, the brackets of the coordinate functions computed in §6.1, and the Reeb
  field `∂_z = X_1`.

### Dependencies

Layers 1, 2 and 4, and §5.6 for §6.4. Tau Ceti: contact Hamiltonian vector fields and Cartan's
formula. Mathlib: the Lie bracket of vector fields. DGFloer standing conventions.

## Downstream consumers

- SymplecticFieldTheory consumes Layer 1 (contact distributions and cooriented forms), Layer 2
  (Reeb fields, their rescaling law, contact vector fields and flows), Layer 4 (the symplectization
  with `ω = dθ = −dλ`) and Layer 6.
- CotangentLagrangian §2.2 (C2.2) uses the contact predicate of the Conventions (Tau Ceti's
  `TauCeti.SmoothForm.IsContactForm`) for its signed cosphere forms; §5.6 consumes that section in
  turn.
- The SymplecticGeometry family places Darboux, Gray and neighbourhood refinements specific to
  contact geometry in Layers 3 to 5.

## Scope and ownership

This roadmap owns, above: the contact line and the annihilator line as smooth bundles, the
coorientation calculus and the volume criterion (Layer 1); the rescaling law in normalized form,
flows of contact vector fields and contactomorphisms (Layer 2); the Darboux theorems and relative
and global Gray stability (Layer 3); the symplectization of a contact structure, lifts of
contactomorphisms, the local Liouville collar and the contactization volume (Layer 4); isotropic
submanifolds, the conformal symplectic normal bundle, the isotropic and Legendrian neighbourhood
theorems, one-jet Legendrians, the twisted one-jet model and unit conormals (Layer 5); the Jacobi
bracket, its line-valued form, its comparison with the symplectization and the Liouville boundary
sign adapter (Layer 6).

Already in the library at the pins, and consumed by name (supplier contracts): the Levi form of a
distribution and contact distributions; contact forms, their kernels, rescaling, transition
functions, pullback invariance and the pointwise linear normal form; the Reeb vector field, its
rescaling law and the contact flat map; contact Hamiltonian vector fields with uniqueness, Cartan's
formula and infinitesimal preservation of `ξ`; the horizontal contact-Moser vector field and its
independence of the defining form; the standard models on `ℝ³`, `ℝ²ⁿ⁺¹` and `S²ⁿ⁺¹`; the cooriented
symplectization `eᵗ α`, its Liouville field and the lift of coorientation-preserving conformal
maps; hypersurfaces of contact type and the contact form they carry; the flow-out identity for a
complete Liouville field; the contactization `dz − λ`, the one-jet space and the change of
primitive; the tubular neighbourhood theorem; the symplectic Darboux theorem on open subsets of
normed spaces. These include the existence and uniqueness of Reeb and contact Hamiltonian vector
fields and the symplecticity of `d(eᵗ α)`, which Layers 2 and 4 therefore do not restate.

Owned elsewhere and consumed here: forms, the exterior derivative, Cartan calculus, flows,
time-dependent flows, distributions and the contact acceptance examples (DifferentialGeometry
Layers 0, 1, 3, 4 and 5); dual, Hom and tensor bundles, connections and transport
(SmoothBundlesConnections §§B2.1, B3.3, B5.0); tubular neighbourhoods (GeometricTopology §1.5); the
symplectic Darboux theorem and Moser lemma on manifolds (HeegaardFloer §4.1); the cotangent
Liouville form, conormal bundles and the unit cosphere bundle with its signed contact forms and
metric-radial comparison (CotangentLagrangian Layer 1 (C1) and §2.2 (C2.2)); first jets of vector
bundles and their connection splitting (PseudodifferentialOperators P1.0).

Not owned here: generic Jacobi manifolds and the integration of Jacobi algebroids and groupoids are
not targets of this roadmap, and generic Poisson structures and symplectic groupoids belong to
LieGroupoidsPoisson (Layers 4 and 6). HeegaardFloer keeps the contact and Floer invariants and the
holomorphic-curve constructions its roadmap specifies. DGFloer owns contact-type and
restricted-contact-type conditions with an explicit primitive, Hamiltonian and holomorphic-curve
analysis and Floer complexes; Layers 1 and 4 here own the contact geometry and the symplectization
those use, and §6.4 gives the sign adapter `λ_D = −λ`. Contact homology and other Floer invariants
need the analytic and chain-level targets of the corresponding Floer roadmap. Legendrian knot
invariants from grid diagrams belong to CombinatorialHeegaardFloer (Lane G, item 11).

## Exact supplier contracts

### From Mathlib

- `ModelWithCorners`, `IsManifold`, `BoundarylessManifold`, `TangentSpace`, `mfderiv`, `mvfderiv`,
  `ContMDiff`, `IsLocalDiffeomorphOn` (a local diffeomorphism at each point of the set; with
  `Set.InjOn` on an open set, a diffeomorphism onto an open image), `Diffeomorph`.
- `Manifold.IsSmoothEmbedding` (a topological embedding that is a smooth immersion) and
  `Manifold.IsImmersion`.
- `VectorField.mlieBracket`, with `[V, W] = DW·V − DV·W` in charts, and its Jacobi identity.
- `VectorBundle`, `ContMDiffVectorBundle`, `Bundle.TotalSpace`, `Bundle.zeroSection`;
  `Orientation` of a finite-dimensional real space; `ContinuousAlternatingMap`; `EuclideanSpace`,
  `unitInterval`, `Module.finrank`.

### From Tau Ceti

- Forms (`TauCeti/Geometry/Manifold/DifferentialForm/`): `TauCeti.SmoothForm`, `TauCeti.RoughForm`,
  `TauCeti.mextDeriv` (with `dα(v, w) = Dα(v)(w) − Dα(w)(v)` in charts), `TauCeti.mpullback`,
  `TauCeti.SmoothForm.mpullback`, `TauCeti.mlieDerivForm` with Cartan's formula
  `TauCeti.mlieDerivForm_eq_interior_mextDeriv_add`, `TauCeti.RoughForm.wedge`,
  `TauCeti.RoughForm.interior`, `TauCeti.hasDerivAt_mpullback_globalFlow`,
  `TauCeti.mpullback_globalFlow_eq_exp_smul`; `TauCeti.SmoothTwoForm.IsSymplectic`.
- Distributions: `TauCeti.IsContMDiffDistribution`, `TauCeti.IsDistributionFrameOn`,
  `TauCeti.IsInvolutiveDistribution`, `TauCeti.IsContMDiffDistribution.exists_local_annihilator`
  (a hyperplane field is locally the kernel of a nowhere-zero covector field); the Levi form
  `TauCeti.distributionLeviForm` with `TauCeti.distributionLeviForm_apply` (it is `−[V, W] mod D` for
  any extensions tangent to `D`), `TauCeti.distributionLeviForm_swap`,
  `TauCeti.IsDistributionFrameOn.mlieBracket_sub_mlieBracket_mem` and
  `TauCeti.isInvolutiveDistribution_iff_distributionLeviForm_eq_zero`.
- Contact distributions and forms (`TauCeti/Geometry/Contact/`): `TauCeti.IsContactDistribution`
  (a `C^n` hyperplane field of rank `dim E − 1` with bijective `u ↦ L_D(u, ·)` at every point; no
  form or coorientation), `TauCeti.IsContactDistribution.finrank_quotient`,
  `TauCeti.IsContactDistribution.odd_finrank`,
  `TauCeti.IsContactDistribution.not_isInvolutiveDistribution`,
  `TauCeti.IsContactDistribution.exists_isContactFormAt`,
  `TauCeti.isContactDistribution_iff_forall_exists_isContactFormAt`; `TauCeti.SmoothForm.IsContactForm`
  (`αₓ ≠ 0` and `dαₓ` nondegenerate on `ker αₓ` at every point), `TauCeti.IsContactFormAt`,
  `TauCeti.SmoothForm.isContactForm_iff_forall_isContactFormAt`, `TauCeti.SmoothForm.kerDistribution`,
  `TauCeti.SmoothForm.isContactForm_iff_isContactDistribution_kerDistribution`,
  `TauCeti.SmoothForm.isContactForm_iff_forall_bijective_distributionLeviForm`,
  `TauCeti.SmoothForm.liftQ_distributionLeviForm_kerDistribution`,
  `TauCeti.SmoothForm.kerDistribution_of_eq_smul`, `TauCeti.SmoothForm.isContactForm_iff_of_eq_smul`,
  `TauCeti.SmoothForm.isContactForm_neg_iff`, `TauCeti.SmoothForm.IsContactForm.odd_finrank`,
  `TauCeti.SmoothForm.IsContactForm.exists_linearEquiv_eq_stdContact`,
  `TauCeti.SmoothForm.kerDistribution_eq_iff_existsUnique_fun_smul` (two nowhere-zero forms have the
  same kernel iff they differ by a unique nowhere-zero smooth multiplier, of either sign),
  `TauCeti.SmoothForm.IsContactForm.isContactForm_iff_of_kerDistribution_eq`,
  `TauCeti.isContactFormAt_mpullback_iff`, `TauCeti.SmoothForm.kerDistribution_mpullback`,
  `TauCeti.SmoothForm.IsContactForm.mpullback`, `Diffeomorph.isContactForm_mpullback_iff`.
- Reeb and contact Hamiltonian fields: `TauCeti.SmoothForm.reebVectorField`,
  `TauCeti.SmoothForm.IsContactForm.eq_reebVectorField_iff`,
  `TauCeti.SmoothForm.IsContactForm.isCompl_kerDistribution_span_reebVectorField`,
  `TauCeti.SmoothForm.IsContactForm.reebVectorField_eq_inv_smul_add_iff`,
  `TauCeti.SmoothForm.IsContactForm.contMDiff_reebVectorField`,
  `TauCeti.SmoothForm.IsContactForm.mfderiv_reebVectorField_mpullback`; the contact flat map
  `TauCeti.SmoothForm.contactFlat` with `TauCeti.SmoothForm.IsContactForm.isInvertible_contactFlat`
  (finite dimension); `TauCeti.SmoothForm.IsContactHamiltonianVectorField`,
  `TauCeti.SmoothForm.contactHamiltonianVectorField`,
  `TauCeti.SmoothForm.IsContactForm.isContactHamiltonianVectorField_iff_eq`,
  `TauCeti.SmoothForm.IsContactHamiltonianVectorField.mlieDerivForm_eq`,
  `TauCeti.SmoothForm.IsContactHamiltonianVectorField.mlieBracket_mem_kerDistribution`,
  `TauCeti.SmoothForm.IsContactForm.isContactHamiltonianVectorField_iff_mlieDerivForm`,
  `TauCeti.SmoothForm.IsContactForm.eq_contactHamiltonianVectorField_of_mlieDerivForm_eq_smul`,
  `TauCeti.SmoothForm.IsContactForm.contactHamiltonianVectorField_one`,
  `TauCeti.SmoothForm.IsContactForm.contMDiff_contactHamiltonianVectorField`; all with the sign
  conventions of Convention 7.
- The contact-Moser field: `TauCeti.SmoothForm.contactMoserVectorField`,
  `TauCeti.SmoothForm.IsContactForm.eq_contactMoserVectorField_iff`,
  `TauCeti.SmoothForm.IsContactForm.contactMoserVectorField_eq_zero_iff`,
  `TauCeti.SmoothForm.IsContactForm.mlieDerivForm_contactMoserVectorField_add`,
  `TauCeti.SmoothForm.IsContactForm.contactMoserVectorField_of_eq_smul` (no positivity of the
  multiplier).
- Standard models: `TauCeti.standardContactForm`, `TauCeti.kerDistribution_standardContactForm`,
  `TauCeti.standardContactDistribution`,
  `TauCeti.isContactDistribution_standardContactDistribution`,
  `TauCeti.not_isInvolutiveDistribution_standardContactDistribution`,
  `TauCeti.reebVectorField_standardContactForm`,
  `TauCeti.reebVectorField_of_eq_exp_smul_standardContactForm`, `TauCeti.innerProductContactForm`
  (`dz − ⟪p, dq⟫` on `V × V × ℝ`), `TauCeti.isContactForm_innerProductContactForm`,
  `TauCeti.mextDeriv_innerProductContactForm_euclideanSpace_apply`,
  `TauCeti.mpullback_innerProductContactForm_real`, `TauCeti.mpullback_innerProductContactForm_neg`;
  `TauCeti.SymplecticForm.sphereContactForm`,
  `TauCeti.SymplecticForm.isContactForm_sphereContactForm`,
  `TauCeti.SymplecticForm.isRestrictedContactType_sphere`,
  `TauCeti.SymplecticForm.mvfderiv_reebVectorField_sphereContactForm`.
- Symplectization, Liouville fields and contactization: `TauCeti.SmoothForm.symplectization`,
  `TauCeti.SmoothForm.isSymplectic_mextDerivₗ_symplectization_iff`,
  `TauCeti.SmoothForm.isLiouvilleVectorField_symplectization`, `TauCeti.symplectizationLift`,
  `TauCeti.SmoothForm.mpullback_symplectizationLift_symplectization` (for `f > 0`);
  `TauCeti.IsLiouvilleVectorField`, `TauCeti.IsContactType`, `TauCeti.IsRestrictedContactType`,
  `TauCeti.IsContactType.isContactForm_mpullback`, `TauCeti.mlieDerivForm_eq_self_of_interior_eq`,
  `TauCeti.mpullback_globalFlow_comp_eq_symplectization` (complete Liouville field);
  `TauCeti.SmoothForm.contactization`, `TauCeti.SmoothForm.mextDerivₗ_contactization`,
  `TauCeti.SmoothForm.isContactForm_contactization_iff`, `TauCeti.contactizationShift`,
  `TauCeti.mpullback_contactizationShift_contactization`,
  `TauCeti.CotangentBundle.isContactForm_contactization_liouvilleForm`.
- Cotangent bundles: `TauCeti.CotangentBundle`, `TauCeti.CotangentBundle.liouvilleForm`,
  `TauCeti.CotangentBundle.symplecticForm` (`ω = −dλ`),
  `TauCeti.CotangentBundle.isExactLagrangianMap_zeroSection`,
  `TauCeti.CotangentBundle.mpullback_liouvilleForm_eq_zero_of_conormal`,
  `TauCeti.CotangentBundle.cosphereBundle`,
  `TauCeti.CotangentBundle.isContactForm_mpullback_neg_liouvilleForm_cosphereBundle`,
  `TauCeti.CotangentBundle.isContactForm_mpullback_liouvilleForm_cosphereBundle`,
  `Diffeomorph.cosphereRadial`, `Diffeomorph.pos_mpullback_cosphereRadial_neg_liouvilleForm_iff`.
- Flows and isotopies: `TauCeti.flowOf`, `TauCeti.flowDomain`, `TauCeti.isOpen_flowDomain`,
  `TauCeti.contMDiffOn_flowOf`, `TauCeti.globalFlow`, `TauCeti.timeDependentFlowOf`,
  `TauCeti.timeDependentFlowDomain`, `TauCeti.mem_timeDependentFlowDomain_of_forall_eq_zero`,
  `TauCeti.Diffeotopy` (a level-preserving diffeomorphism of `[0, 1] × M` starting at the identity).
- `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset` (tubular neighbourhood of a
  smooth embedding, target Hausdorff and second countable, no compactness or closed image) and
  `TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq` (Darboux for a closed
  two-form on an open subset of a normed space, nondegenerate at the centre).

### From TauCetiRoadmap.DifferentialGeometry

Layers 0 and 1 (forms, wedge, exterior derivative, naturality, Cartan calculus, item 1.4), Layer 3
(maximal flows 3.2, completeness 3.3, time-dependent flows 3.5), Layer 4 (distributions, item
4.1, and the contact acceptance examples: the model `dz − y dx` through the coordinate
swap `(x, y, z) ↦ (y, x, z)` and the absence of integral surfaces of the standard contact
distribution through any point) and Layer 5 (the homotopy operator 5.4).

### From TauCetiRoadmap.SmoothBundlesConnections

§B2.1 (dual, Hom and tensor bundles of finite rank), §B3.3 (connections induced on associated and
dual bundles, as Mathlib's `CovariantDerivative`) and §B5.0 (horizontal transport along curves and
the associated transport in vector bundles, smooth in parameters).

### From TauCetiRoadmap.GeometricTopology

§1.5: tubular neighbourhoods of smooth embeddings, with no compactness hypothesis (existence is Tau
Ceti's `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`).

### From TauCetiRoadmap.SymplecticGeometry.CotangentLagrangian

Layer 1 (C1: the Liouville form `λ_can` and `ω_can = −dλ_can`) and §2.2 (C2.2: conormal bundles of
embedded submanifolds with `λ_can|N*S = 0`; the unit cosphere bundle with `α_b = −λ_can|S*Q` and
`α_g = +λ_can|S*Q`, both contact, and their metric-radial comparison).

### From TauCetiRoadmap.HeegaardFloer

§4.1 (F2.1): Darboux charts for symplectic forms on manifolds and the Moser lemma, with
`ι_(X_f) ω = df`.

### From TauCetiRoadmap.PseudodifferentialOperators

P1.0, first jets of a vector bundle: `J¹V` with its transition maps and projection, the exact
sequence `0 → T*M ⊗ V → J¹V → V → 0`, the splitting given by a connection and the
difference-of-connections change of splitting; used for a real line bundle.

### From TauCetiRoadmap.DGFloer

The standing sign dictionary (`ω = dλ_D`, `ι_Z ω = λ_D` for Liouville domains, `λ_D = −λ_can` on
cotangent bundles) and the contact-type conditions of Layer 6, item 4.

## References

- S. Courte and S. Guillermou, *Introduction to symplectic and contact geometry*, course notes,
  Université Grenoble Alpes (2018), Chapter 3, pp. 33–38: the `TM/ξ`-valued Levi form and the volume
  criterion (pp. 34–35), one-jet Legendrians and Proposition 3.5 (p. 35), contact vector fields
  (Lemma 3.7 and Remark 3.8, p. 36), relative and closed Gray stability (Theorems 3.9 and 3.10), the
  Darboux theorems (Theorems 3.11 and 3.12) and the Legendrian neighbourhood theorem (Theorem 3.13);
  [author-hosted text](https://www-fourier.univ-grenoble-alpes.fr/~courtes/cours.pdf). Cited in
  §§1.1, 1.3, 2.2, 3.1–3.4, 5.1, 5.3, 5.5 and 6.2.
- H. Geiges, *Contact geometry*, in Handbook of Differential Geometry, vol. 2, North-Holland (2006),
  315–382; cited in the numbering of [arXiv:math/0307242v2](https://arxiv.org/abs/math/0307242v2):
  coorientability (§2, p. 4), Remark 2.2, Gray stability (Theorem 2.20), Darboux (Theorem 2.24), the
  conformal symplectic normal bundle (§2.4.2), the isotropic neighbourhood theorem (Theorem 2.27)
  and fronts of Legendrian curves (Lemma 2.45). Cited in §§1.2, 1.3, 3.2, 3.4, 5.1, 5.2 and the
  Examples of Layer 5.
- A. Kriegl and P. W. Michor, *The Convenient Setting of Global Analysis*, AMS (1997), §43,
  43.17 and Proposition 43.18, pp. 472–473, for one-jet Legendrians and the strict Legendrian
  neighbourhood construction; [author-hosted text](https://www.mat.univie.ac.at/~michor/apbook.pdf).
  Cited in §5.3 and §5.4.
