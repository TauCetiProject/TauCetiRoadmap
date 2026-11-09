# Contact geometry and contact dynamics

Develop the intrinsic geometry of contact hyperplane fields, Reeb and contact Hamiltonian
dynamics, contact Darboux and Gray stability, symplectization, and isotropic/Legendrian
neighborhoods. Include noncoorientable contact lines and their Jacobi bracket; a globally chosen
contact form is additional data, not the definition of a contact structure.

Use [DifferentialGeometry](../../DifferentialGeometry/README.md)'s generic forms, exterior
derivative, distributions, Lie brackets and smooth flows. [SmoothBundlesConnections
B2–B5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/887) supplies the finite-rank bundle, dual/tensor,
connection and bundle-transport operations; CG1 constructs the contact line as the quotient by the hyperplane subbundle
using adapted local frames. [GeometricTopology Layer1](../../GeometricTopology/README.md) supplies
tubular neighborhoods. [CotangentLagrangian C1 and C2.2](../CotangentLagrangian/README.md) owns the
cotangent Liouville form and unit-cosphere application; CG1 itself is independent of those
applications. HeegaardFloer and DGFloer retain their
Floer complexes, holomorphic-curve analysis and invariants; this roadmap offers the adjacent
contact-geometry interface for those developments.

## Conventions and carriers

Work over finite-dimensional real smooth Hausdorff second-countable manifolds, boundaryless unless
a local/contact-type-boundary result says otherwise. Let `dim M = 2n+1` be explicit. Reuse
`SmoothForm I M ℝ 1`, `mextDeriv`, manifold pullback, `TangentSpace`, and the canonical
distribution family `D x : Submodule ℝ (TangentSpace I x)`.
The standard model is `α_std=dz−Σ p_i dq_i` on coordinates `(q,p,z)`.
For n=1 it is the existing `dz−x dy` convention under `(q,p,z)=(y,x,z)`;
DG4's displayed `dz−y dx` model uses `(q,p,z)=(x,y,z)` and its already-owned
coordinate-swap adapter. These identify the same standard model by explicit
linear coordinate changes.

The primary invariant object is a smooth hyperplane distribution `ξ ⊂ TM` of rank `2n` with
nondegenerate Levi form

`Lξ : Λ² ξ → TM/ξ`, `Lξ(u,v) = −[U,V] mod ξ`.

Nondegeneracy means for each x the induced map `ξₓ → Hom(ξₓ, (TM/ξ)ₓ)`, `v ↦ (w ↦ Lξ(v,w))`, is an
isomorphism. This formulation is intrinsic and does not require coorientation. Its quotient `L =
TM/ξ` is the **contact line**. This minus sign is fixed so that when `ξ=ker α`, the isomorphism `α
: TM/ξ ≃ ℝ` sends the Levi form to `dα|ξ` (Cartan’s formula). Distinguish: (a) contact
distribution ξ, (b) its contact line L, (c) a coorientation (orientation/positive ray of L), and
(d) a global contact form α, a nowhere-zero trivialization of the annihilator line `ξ⁰ ⊂ T*M`. A
global form exists iff that line is trivial; do not use a global α as the definition in the
noncoorientable case.

For a chosen α, contactness is the pointwise nonvanishing of `α ∧ (dα)^n`. Replacing α by `f α`
for nowhere-zero f preserves ξ; f>0 preserves the chosen coorientation, f<0 reverses it. Prove the
equivalence between this volume condition and Levi nondegeneracy, including the line-valued
formulation. The nonvanishing condition is pointwise, not a chosen orientation or a normalized
volume form.

Use the SymplecticGeometry convention `ω = −dλ` and `ι_(X_f)ω=df`. Contact convention: `α(Rα)=1`,
`ι_(Rα)dα=0`; for contact Hamiltonian H, `α(X_H)=H`, `ι_(X_H)dα=(Rα H)α−dH`, whence `L_(X_H)α=(Rα
H)α`. This makes the local flow preserve ξ and its positive coorientation. State explicitly which
convention changes if adopting α_H=−H or alternate signs.


## Milestones

### CG1 — Contact distributions, contact line and cooriented forms

Build predicates on the existing distribution family and rank/frame APIs, not a new distribution
record. Provide the Levi form as the bracket modulo ξ; prove it is C∞-bilinear in fiber arguments
(the derivative terms cancel modulo ξ), tensorial and independent of extensions. Prove the contact
criterion from nondegeneracy and, in a cooriented chart, from α∧(dα)^n ≠ 0. Build local contact
forms as nonzero sections of `ξ⁰`, with transition functions, and prove the α↦fα laws. Include the
standard R³ structure ker(dz−x dy): explicit local frame, dα, contact volume, Reeb vector and the
existing non-involutivity witness. Consume DG4's stronger pointwise
no-integral-surface acceptance target through its coordinate adapter.

Acceptance models: standard R^(2n+1), the sphere S^(2n+1) with the restriction of `Σ_j (x_j
dy_j−y_j dx_j)` (check nonvanishing on the sphere by the radial Liouville field), and local
coorientation-reversing changes. Keep the 3D model linked to `TauCeti.standardContactDistribution
ℝ`; prove the coordinate adapter only, never duplicate that distribution implementation.

### CG2 — Reeb dynamics, contact vector fields and local flow

For a cooriented contact form α, use the isomorphism dα|ξ to prove existence and uniqueness of Rα.
For nowhere-zero f prove the exact rescaling law `R_(fα)=Rα/f+Y`, where `Y∈ξ` is uniquely
determined by `ι_Y dα|ξ=df|ξ/f²`; equivalently `R_(fα)=(Rα+Z)/f`, where `Z=fY` satisfies
`ι_Zdα|ξ=df|ξ/f`. The factor f² follows from `α(R_(fα))=1/f`; verify both equations directly. For
α=dz−xdy and f=eˣ, the result is `e^(−x)(∂y+(x+1)∂z)`. Also compute Rα=∂z for the standard form.
Define contact Hamiltonian fields by the displayed equations, prove uniqueness, Cartan formula and
infinitesimal preservation of ξ. State local flow intervals from the existing smooth ODE theorem;
assert global flow only with completeness/compactness hypotheses. A contactomorphism preserves ξ;
a strict contactomorphism preserves α; a coorientation-preserving contactomorphism pulls α back to
a positive multiple. Prove these are distinct notions and relate them to the contact Hamiltonian
local flow.

### CG3 — Darboux and Gray stability

Contact Darboux: each point in a (2n+1)-dimensional smooth contact manifold has a
contact chart, preserving a chosen local coorientation, to `(ℝ^(2n+1), ker α_std)`; for forms, pullback is
a nowhere-zero factor times the standard form, positive when coorientation is fixed. Proof route:
choose a contact-frame basis at p; use the linear contact normal form for the Levi form; apply a
local contact-Moser path, solve the ξ-linear equation using nondegeneracy of dα|ξ, and shrink the
chart so the time-dependent field has flow for the full compact parameter interval. This is
distinct from symplectic Darboux. Also prove the form-level Darboux theorem for a
chosen contact form, with exact pullback of `α_std`: use the Reeb flow to write
`α=dz+β` on a transverse slice, apply HF F2.1's symplectic Darboux to `dβ`,
and absorb the resulting exact difference of primitives into z. Generic
form/flow/Moser primitives come from DG and HF F2.1; all contact-specific
algebra and equations remain here.

Relative Gray: let M be any boundaryless manifold, K a closed subset, and
U an open neighborhood of K. Let ξ_t be contact distributions on U, jointly
smooth on an open time interval containing [0,1], whose hyperplanes agree on
`TM|K` for every t. Coorientation is not assumed. Prove a neighborhood-germ
isotopy φ_t fixing K with `(φ_t)_*ξ_0=ξ_t`. Locally its form identity is
`φ_t^*α_t=g_t α_0`, with nowhere-zero g_t, positive for compatible chosen
coorientations. Solve `Y_t∈ξ_t` and
`(ι_(Y_t)dα_t+∂t α_t)|ξ_t=0`. Prove independence under
`α_t↦f_t α_t` for every nowhere-zero local multiplier, so the field glues
without a global contact form or an oriented contact line.
The Moser field vanishes on K at every parameter. Each stationary trajectory
exists through [0,1]; openness of the time-dependent flow domain gives open
source and target neighborhoods containing K for its time1 map and inverse.
This needs no compactness of K and no globally uniform tube width. When U=M is compact and
boundaryless, this gives a global isotopy. Here a closed embedded submanifold is
without boundary and closed as a subset; it need not be compact.

### CG4 — Symplectization and contactization

For a contact line `L=TM/ξ`, let `π:L*\setminus 0→M` be the complement of the zero section in its
dual line bundle. Define the homogeneous tautological **one-form** `θ` at `(x,ℓ)` by
`θ_(x,ℓ)(v)=ℓ([Tπ(v)]∈T_xM/ξ_x)`. Prove that `ω=dθ` is symplectic by the Levi nondegeneracy
calculation. Set `λ=−θ`, so `ω=dθ=−dλ`; this convention agrees with the symplectic owner. A
contactomorphism `F` induces the unique lift to the punctured dual contact line by its dual
quotient-line map; it preserves `θ`, including when it reverses coorientation. For cooriented data
`F*α'=fα`, `f>0`, this is the unique homogeneous symplectic lift `(t,x)↦(t−log f(x),F(x))` under
`θ=e^tα` (equivalently `λ=−e^tα`). It is not an arbitrary `t`-translation: a fixed strict
symplectic lift has no free additive constant. The usual `ℝ×M` symplectization is the trivialized
cooriented case; the full `L*\setminus 0` construction also covers sign-reversing contact maps.

For an exact symplectic manifold with `ω=−dλ`, define its Liouville field by
`ι_Zω=−λ`. If an embedded hypersurface Y is transverse to Z, prove that
`α=ι_Zω|Y=−λ|Y` is contact. On a neighborhood of `{0}×Y` in `ℝ×Y`, the local
flow map `Φ(s,y)=φ_Z^s(y)` is a diffeomorphism onto a neighborhood of Y and
satisfies `Φ*(−λ)=e^s α` and `Φ*ω=d(e^s α)`. Prove `L_Zλ=λ` and use its
flow identity to pin both signs. For noncompact Y, use an open domain with
variable collar width; a uniform width requires a separate compactness or
flow-domain hypothesis. This collar is offered to Floer boundary
constructions. Under DGFloer's `ω=dλ_D` convention the primitive is
`λ_D=−λ`; its boundary form `α=λ_D|Y` agrees with the one here.

For exact symplectic `(W,ω=−dλ)`, contactization on `W×ℝ_z` uses `α=dz−λ`; then `dα=ω`, and the
contact volume is nowhere zero. For `W=T*Q` use its canonical cotangent Liouville form `λ_Q`,
giving the standard jet form `α=dz−λ_Q` on `J¹Q=T*Q×ℝ`. State how changing λ by an exact form
changes the z-coordinate.

### CG5 — Isotropic and Legendrian neighborhoods

An immersed submanifold N is isotropic when TN lies in ξ. Prove that the Levi
form then vanishes on TN by pulling back a local defining form and its exterior
derivative. Prove the dimension bound dim N≤n and define its L-valued conformal symplectic normal bundle
`(TN)^⊥_L/TN`, using local defining forms and their transition laws. Prove the isotropic
neighborhood theorem: a diffeomorphism between closed embedded isotropic submanifolds, together
with an identification of their contact lines and a compatible conformal-symplectic normal-bundle
isomorphism, extends to a contactomorphism of neighborhood germs realizing these data. Build the
full first-order tangent identification and realize it by a tubular embedding.
Extend the prescribed contact-line isomorphism from N to tubular neighborhoods
using bundle transport along the normal fibers (SmoothBundlesConnections B5),
so the two quotient forms can be compared in one line bundle. Choose complements
so their full values and line-valued Levi forms agree along N. Their affine
interpolation is contact on a neighborhood of N for all t∈[0,1]. Apply CG3's
relative Gray theorem there. This first germ fixes N and its contact line, but
its induced normal map need only be homotopic to the prescribed one.

Realize the prescribed normal map exactly by an additional contact flow. On the
source conformal-symplectic normal bundle S, write A_t for the normal-bundle
map induced by the Gray isotopy after the initial tangent identification.
The preceding full-value/Levi agreement makes A_t symplectic in the fixed
contact-line identification, with A_0=id. Set `B_t=A_t⁻¹` and
`K_t=(∂t B_t)B_t⁻¹`. Prove K_t is infinitesimally symplectic. The line-valued
quadratic Hamiltonian `H_t(s)=−½ Lξ(K_t s,s)` has Hessian
`−Lξ(K_t v,w)`. Extend it to a tubular neighborhood using a bundle complement;
its value and first derivative vanish on N. CG2's contact Hamiltonian field
therefore vanishes on N and induces K_t on S, by differentiating
`ι_(X_H)dα=(Rα H)α−dH` along N. Its flow fixes the contact line and has normal
map B_t. The line-valued construction glues in noncooriented charts. Stationary
trajectories along N and the open flow domain give a full-parameter germ
without compactness of N. Compose this correcting flow on the source with the
first germ to obtain exactly the specified normal map. Prove independence of
auxiliary complements at the level of the stated germ existence theorem.
Its Legendrian specialization has zero conformal symplectic normal bundle.

Define a Legendrian immersion/submanifold Λ^n⊂(M^(2n+1),ξ) by `TΛ⊂ξ` (equivalently pullback of a
local defining contact form is zero); distinguish embeddings from immersions. In J¹Q, 1-jets
`j¹f=(q,df_q,f(q))` are Legendrian; prove the graph criterion and contact lift.

For a closed embedded cooriented Legendrian `Λ` and a chosen contact form `α` near it, prove the
form-level neighborhood theorem: there are neighborhoods of `Λ` and the zero section of
`J¹Λ=T*Λ×ℝ`, and a diffeomorphism fixing `Λ` whose pullback sends the model contact form `dz−λ_Λ`
exactly to `α`. In particular, this is a **strict** contactomorphism for the chosen forms, not
merely preservation of their kernels. Follow the finite-dimensional construction in Kriegl–Michor,
Proposition 43.18: after identifying the full first-order contact data along `Λ`, arrange the two
forms to have the same value and exterior derivative on the full ambient tangent bundle along the
zero section; interpolate the contact forms on a sufficiently small neighborhood; solve
`i_(X_t)dα_t+d(α_t(X_t))=α_0−α_1`; solve the scalar Reeb-direction equation `d
h_t(R_t)=(α_0−α_1)(R_t)` for `h_t=α_t(X_t)` on a transverse slice with zero initial values; invert
`X↦i_Xdα_t+α_t(X)α_t`; and integrate the strict Moser field, which vanishes on `Λ`. This exact
form identity is required: the contact-structure Gray argument alone gives only a conformal
relation and does not discharge this target. A distribution-level statement may instead record
`F*α'=gα` for a nowhere-zero multiplier (positive when coorientation is preserved); that weaker
conclusion is not described as equivalent to strict form preservation. Kriegl–Michor's model
`θ_Λ−dt` is carried to `dz−λ_Λ` by reversing both the cotangent-fiber and real coordinates.
Compact `Λ` is a sufficient special case. For a possibly nontrivial contact line `L` along `Λ`,
consume [PseudodifferentialOperators
P1.0](https://github.com/TauCetiProject/TauCetiRoadmap/pull/952)'s
vector-bundle first jets `J¹L` and their transition/projection laws. A connection identifies that
existing carrier with `L ⊕ (T*Λ ⊗ L)`: consume PDO P1.0's connection splitting
and difference-of-connections law specialized to L. Choose a connection `∇` on
`L` and let `z` and `p` be the
tautological fiber sections. The `L`-valued one-form `θ=∇z−p` (with `p` evaluated on the base
projection) defines the hyperplane field near the zero section; its Levi pairing there is the
tautological pairing between `TΛ` and `T*Λ⊗L`. Prove this is contact near the zero section, give
transition maps, and prove that changing `∇` yields contactomorphic germs, explicitly by the fiber
shift in p induced by the difference of the two connections. In a trivialization with flat
connection this is `dz−Σ p_i dq_i`. Then prove the corresponding neighborhood theorem for a closed
embedded Legendrian with contact line `L|Λ`: its conclusion is a contact-hyperplane
germ equivalence inducing the specified identification of contact lines along Λ.
The canonical line-valued quotient forms intertwine under the induced line-bundle
map. The chosen-form strict theorem above additionally fixes a contact-form
trivialization; its untwisted jet model is the trivial-line case. A local/noncompact theorem must state the proper tubular germ and flow-domain hypotheses.
Keep generic tubular neighborhoods with GeometricTopology, while this milestone consumes them.

Cosphere application: consume CotangentLagrangian C1’s cotangent Liouville form and C2.2’s
unit-cosphere metric-rescaling result; prove the contact-line/coorientation invariance under
positive radial identification. For an embedded submanifold S⊂Q of positive
codimension, its unit conormal `N*S∩S*Q` is an embedded Legendrian for both
`α_b` and `α_g`; prove this from `λ_can|N*S=0` and the dimension formula.
For embeddedness, the radial field is tangent to the conic N*S and
transverse to S*Q, so their intersection is transverse. It is closed in S*Q
when S is closed in Q. Arbitrary nonclosed embedded S
need not give a closed unit conormal. For the canonical symplectic convention use C2.2's boundary form
`α_b=−λ_can|S*Q`: the chosen positive-annihilator component has
`θ=r α_b` and `dθ` pulls back `ω_can`. For the alternative cogeodesic form
`α_g=+λ_can|S*Q=−α_b`, the same radial map pulls back `ω_can` to
`−d(r α_g)`; it is anti-symplectic for `d(r α_g)`. The full punctured contact
line retains both sign components; the radial symplectomorphism just stated
uses the chosen positive component. Do not duplicate C2.2's construction.

### CG6 — Contact/Jacobi interface; Floer boundary

For cooriented α, define `{f,g}_α = dα(X_f,X_g)+f Rα(g)−g Rα(f)` only after fixing the CG2
Hamiltonian convention; prove it is a Jacobi bracket (skew, first-order Leibniz, Jacobi) from the
contact equations. In the noncooriented case, functions must be replaced by sections of the
contact line, with local trivializations and transition-law proof. Prove the contact-induced
bracket directly from contact vector fields. In a contact-form trivialization of the
symplectization with positive fiber coordinate r, pin the comparison `{r f,r g}_ω=r{f,g}_α` for
`ω=d(rα)` and SymplecticGeometry's `ι_(X_F)ω=dF` and `{F,G}_ω=ω(X_F,X_G)` conventions; prove
independence of trivialization on the punctured dual contact line. Explicitly derive
`X_(rf)=r(Rα f)∂r−X_f`, so `X_r=−Rα`, in the same conventions.
Generic Jacobi manifolds and
Jacobi algebroid/groupoid integration are outside this contact floor;
[LieGroupoidsPoisson](../../LieGroupoidsPoisson/README.md) owns the distinct generic Poisson and
symplectic-groupoid theory.

HeegaardFloer remains owner of contact/Floer invariants and holomorphic-curve constructions that
its roadmap specifies. CG1/CG4 own the contact-geometry and symplectization
interfaces for Liouville/contact-type-boundary geometry. On cotangent examples
the boundary form is `−λ_can`, as C2.2 specifies. DGFloer owns contact-type and
restricted-contact-type conditions with the primitive explicit, Hamiltonian and
holomorphic-curve analysis and Floer complexes. CG1's contact form and CG4's
Liouville collar offer a primitive-restriction interface for those boundary
constructions, with the explicit `λ_D=−λ` sign adapter above.
Contact homology and other Floer invariants require the corresponding Floer
roadmap's explicit analytic and chain-level targets.


## Order

CG1's line-valued Levi form, nondegeneracy and local forms precede CG2. Its adapted frames and
CG2's linear inversion precede the contact-Moser equations in CG3. CG4 uses CG1's contact line and
CG2's vector fields; CG6 follows CG2 and CG4. CG5's normal-bundle comparison follows CG1, CG3 and
GeometricTopology's tubular theorem. Its first-jet carrier and connection splitting consume only
PDO P1.0's first-jet subtarget and SBC B2–B4. Its smooth line-bundle
transport additionally consumes SBC B5. These dependencies are independent
of density adjoints, Sobolev or pseudodifferential analysis. CG1–CG4 do not depend on that jet construction. All constructions
include restrictions, changes of local form, pullback by diffeomorphisms, functoriality and
inverse/uniqueness comparisons before their use in the neighborhood theorems.

## References

- Gray, *Some global properties of contact structures*, Annals of Mathematics69 (1959),421–450, [primary article](https://www.jstor.org/stable/1970192).
- Geiges, *An Introduction to Contact Topology*, Cambridge Studies in Advanced Mathematics109 (2008), for contact Darboux, Gray and isotropic neighborhood theorems.
- Kriegl–Michor, *The Convenient Setting of Global Analysis*, AMS (1997), §43, Proposition43.18, for the strict Legendrian neighborhood construction; [author-hosted text](https://www.mat.univie.ac.at/~michor/apbook.pdf).
- [Grenoble contact-geometry course notes](https://www-fourier.ujf-grenoble.fr/~courtes/cours.pdf), §§3.2–3.3, for intrinsic contact lines, contact vector fields and local/relative Gray stability.
