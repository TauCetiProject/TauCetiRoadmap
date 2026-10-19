# Geometric representation categories and coherent local transport

A family of representation categories needs more than a category at each
parameter and an equivalence for each pair of isomorphic parameters. Transport
must respect identities and composition, act on morphisms, and commute coherently
with the representation symmetries. This roadmap develops those interfaces for
smooth affine Lie-algebra modules at a fixed level and their critical central
characters. Its local Langlands endpoint is the precise categorical-lift
conjecture; the conjecture's existence is not an unconditional theorem target.

The reusable library consists of categorical group actions, full-subcategory
restriction, coherent actions on the supplied central-character categories,
equivariant groupoid transport, descent along equivalences of parameter
groupoids, and the outer-derivation/self-extension infinitesimal bridge.
These constructions use Mathlib's categories, monoidal actions and
pseudofunctors. They do not replace these carriers with private versions.

## Scope, conventions and prerequisites

The representation-side group is a connected simply connected simple complex
algebraic group `G`; its Lie algebra is `𝔤`. The Langlands-dual group `G∨` is
adjoint. The representation-side group of complex loop points is
`H=G(ℂ((t)))`. The critical form is `κc=-½ Killing`, and the distinguished central
generator acts as identity. Modules are algebraic vector spaces with discrete
topology, smooth in the vectorwise sense `∀v ∃N>0, t^N𝔤[[t]]·v=0`.
The categorical group actions here are coherent actions by complex loop points.
They do not assert that every smooth module has a single rational congruence
stabilizer. AffineLieAlgebras A3's uniform rational `K_N` integration theorem
requires finite generation; the unrestricted smooth category retains the
vectorwise condition. Mere objectwise isomorphisms are not coherent equivariance.
Formal coefficient rings and modules carry the discrete coefficient topology;
the completed algebra carries its inverse-limit topology. ALA Suggested installs
its discrete complex-coefficient instance locally. GRC's generic signatures
instead take the actual topological algebra and continuity hypotheses explicitly;
its affine application installs ALA's supplied completion topology. Ordinary
complex-point Lie groups in FCO retain their usual complex topology.

[AffineLieAlgebras A2–A5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/affine-lie-algebras-20261018/TauCetiRoadmap/AffineLieAlgebras/README.md) supplies the actual
smooth level-one module category, the continuous completed-enveloping action,
the equivalence of these categories, kernels, cokernels, sums, continuous
coinduction, enough injectives and the native `HasExt` adapter. A2 exports
continuous completed loop/coordinate automorphisms and their order-shift bounds.
A5 owns generic strict central-character categories, closed central quotients
and their twist comparisons; A8 specializes these to critical oper characters
and the center-fixing representation-side loop action. A6 supplies the flat
formal deformation and its compatible higher-order truncations.
[FormalConnectionsOpers F3–F8](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1056)
supplies the original and dual loop groups and congruence subgroups, dual
opers, their function algebra, coordinates, evaluation, the gauge-isomorphism
groupoid and its cotangent Lie-algebroid comparison.
These are construction prerequisites and independent owners, not applications
of the conjecture below.

Use `ObjectProperty.FullSubcategory` for restrictions of `ModuleCat` or the
existing smooth-module category. The critical-character equation is an actual
predicate: for every central `z` and vector `v`, `z·v=χp(z)v`. AffineLieAlgebras A5
constructs
this category and A8 its critical specialization; consume these exact carriers.

The parameter groupoid `Γ` has oper objects `p`; arrows `p→q` are **all
isomorphisms of their underlying dual local systems**, including automorphisms.
An arrow may be written `(p,q,g)` with `g∈G∨(ℂ((t)))` after trivialization. It
need not preserve the oper Borel reduction. Composition of `g:p→q` followed by
`h:q→r` is `hg`. This is FormalConnectionsOpers F8's `IsomOp`, not the
Borel-preserving oper groupoid and not a global action of `G∨((t))` on a
Drinfeld–Sokolov slice. The separate group `H` acts within each character fiber.

For a left group action, `T_(gh)=T_g∘T_h`, written `T_h ⋙ T_g` in Lean. The
native category `SingleObj H` has `g ≫ h = h*g`. Mathlib's endofunctor tensor
is `F⊗G=F⋙G`; therefore left actions correspond to monoidal functors into its
**monoidal opposite**, as in `MonoidalLeftAction.curriedActionMop`. Pin this
convention in every comparison and transported action.

## R1. Categorical actions and invariant full subcategories

Consume `MonoidalLeftAction (Discrete H) C`, `SingleObj H`, `LocallyDiscrete`,
`Cat`, `Pseudofunctor`, `Pseudofunctor.StrongTrans` and modifications. Construct
the comparison between a native monoidal left action and a pseudofunctor
`LocallyDiscrete (SingleObj H) ⥤ᵖ Cat` concentrated at `C`. Prove the formulas
for units, group products, inverse equivalences and action on morphisms. The
comparison must transport the unit/associator coherence, rather than merely
matching object functions. The TODO in the native action file is a construction
target here, using the existing carriers.

For an isomorphism-stable object predicate `P`, prove an action preserving `P`
restricts to `P.FullSubcategory`. Construct the fully faithful inclusion, its
equivariant comparison, and the canonical comparison when restricting in two
steps. An equivariant functor carries natural isomorphisms
`T_g^C ⋙ F ≅ F ⋙ T_g^D` satisfying the unit and product diagrams. Build identity,
composition, equivariant natural transformations and transport along equivalences.
Prove the comparison with strong transformations between the corresponding
classifying-group pseudofunctors. For linear categories, prove restriction and
transport retain scalar linearity. When the full subcategory inherits an abelian structure, prove that the
restricted exact actions preserve its inherited kernels and cokernels. Build
this inherited structure under the explicit hypotheses that P contains zero
and is closed under finite biproducts, kernels and cokernels. For strict
central-character fibers these closure properties follow from the scalar-action
equation; no closure under arbitrary ambient extensions is inferred.

Define the source's objectwise congruence-invariance predicate on an `H` action:
`∀ M ∃ N>0 ∀ g∈K_N, Nonempty (T_g M ≅ M)`.
Prove invariance under equivariant equivalence and restriction to stable full
subcategories. This predicate asks only for objectwise isomorphisms; coherent
rational integration with the prescribed Lie derivative is separate data.

These are complete interfaces: constructors, extensionality on components,
identity/product simplifications, inverse-action comparison, inclusion
naturality, equivalence invariance and the associated coherence lemmas.

## R2. Coherent twists on the supplied module categories

Consume AffineLieAlgebras A5's generic discrete continuous module object
property on `ModuleCat A`, its annihilator/open-ideal criterion, categorical
closure, central-character predicate, closed central-ideal quotient and category
comparison. For products use A5's smooth vectors in the ordinary product. These
constructions have one owner, A5. R2 builds the categorical coherence of twists
on those supplied categories.

For a group homomorphism `a:H→Aut_cont,ℂ(A)`, use the actual continuous algebra
equivalences and native `ModuleCat.restrictScalars` to construct `T_h` by
restricting through `a_h⁻¹`. Assemble the supplied A5 single-automorphism
comparisons into `MonoidalLeftAction (Discrete H) C` and its R1 classifying-group
pseudofunctor. Pin the underlying vector spaces and linear maps. The unit and product
comparisons are exactly the restrictions of native
`ModuleCat.restrictScalarsId'` and `ModuleCat.restrictScalarsComp'`, with identity
underlying linear maps, transported through the fully faithful inclusions.
Their hom and inverse components must be these maps, not a scalar multiple.
The identity `a_(gh)⁻¹=a_h⁻¹∘a_g⁻¹` gives `T_(gh)=T_g∘T_h`.
Build the pseudofunctor using these fixed comparisons and prove its associativity
and identity coherence, inverse equivalences and naturality. Apply the same
fixed-comparison construction to each rank-one character fiber.
The R1 monoidal-action presentation of that rank-one pseudofunctor must have
the same fixed unit and associator cells. After the action-functor comparison,
its unit is `rankOneTwistUnit`; its associator at g,h is
`rankOneTwistComp(p,h,g)`, since `(g⊗h)·M=g·(h·M)` corresponds to the
functor order `T_h ⋙ T_g`. Pin equality of the actual natural isomorphisms,
including hom and inverse components; equality of action functors alone does
not specify these cells.

Use A5's center-fixing restriction theorem for a fiberwise action. For an
automorphism moving a central character, use its exported twist functor
`C_χ→C_(χ∘a_h⁻¹|Z)`. Prove the full-subcategory inclusion and central-quotient
comparison are equivariant, including compatibility with two successive
restrictions. This is coherence of existing category comparisons rather than a
second construction of the categories or their stability lemmas.

## R3. The critical representation family

Construct `Ccrit` from A3 and the equivalent discrete module category of A5.
For each dual oper `p`, compose the continuous A8 center isomorphism with F5's
evaluation to obtain `χp`. Consume A8's `Ccrit(p)` and the A5 comparison of its
Lie-module and completed-module presentations. Assemble these comparisons into
the R2 action family, preserving their kernels, cokernels and arbitrary sums.

Construct the coherent representation-side `H` action on each `Ccrit(p)` by
applying R2 to A8's center-fixing automorphism action and stable fibers; prove
naturality on intertwiners, units, products and inverse functors. This is an unconditional construction target.
The dual
gauge arrow `g:p→q` gives no algebra automorphism or categorical transport by
definition; those functors are the subject of R4's conjecture.

Let `S=Aut_cont,ℂ(ℂ[[t]])` be the algebra-automorphism group, extended to
Laurent series. Write `σφ(f)(t)=f(φ(t))`. Its multiplication satisfies
`σφ σψ=σ_(ψ∘φ)` where `(ψ∘φ)(t)=ψ(φ(t))`. Thus the right parameter action
`(p^φ)^ψ=p^(φ∘ψ)` from F1 is the left `S` action `σφ·p=p^φ`.
For the A2 completed coordinate automorphism `aσ`, pin A8 equivariance as
`aσ(F)=F∘σ⁻¹` on oper functions. Then
`χ_(σ·p)=χp∘aσ⁻¹`; module restriction through `aσ⁻¹` gives precisely
`Ccrit(p)→Ccrit(σ·p)`. For `φ(t)=at`, the quadratic current mode `S_n` maps to
`a^n S_n`, whereas the oper coefficient `L_n` maps to `a⁻ⁿ L_n`.
Prove these formulas and the coordinate character equation from the suppliers.

Define `β:S→MulAut H` by coefficient substitution `βσ(h)=σ(h)` and consume
native `SemidirectProduct β`, written `H⋊S`, with product
`(h,σ)(k,τ)=(h βσ(k),στ)`. It acts on opers through `S`.
Construct the complex-linear category family as a pseudofunctor from the native
`ActionCategory (H⋊S) Op` to `Cat`, sending `(h,σ):p→σ·p` to
`T_h^(σ·p) ∘ T_σ^p`. Prove the covariance comparison
`T_σ ∘ T_h ≅ T_(βσ h) ∘ T_σ`, the product/unit coherence and its restriction
to R3's `H` actions. Coordinate arrows belong to this action groupoid; they do
not become dual local-system arrows in `IsomOp`. R4's conjecture prescribes
original-loop equivariance only, and asks for no additional coordinate extension.

For finitely generated smooth modules, use A3's compatible rational `K_N`
integration to prove R1's objectwise congruence-invariance predicate. In rank
one, map F3's positive-loop congruence subgroup into original Laurent loops
through its coefficient-inclusion homomorphism and A8's Hopf/matrix dictionary;
prove injectivity and antitonicity. Apply R1's pseudofunctor/monoidal-action
comparison to `rankOneActions p` before instantiating the predicate. Prove that
its result equals the complete `rankOneMonoidalAction p` fixed by the action-
functor, unit and associator equations; compare all data, not just action
functors. Also apply
A3's family `Q_M=Uκ/Uκ·t^M𝔤[[t]]`: coefficientwise `G(ℂ[[t]])` conjugation
normalizes the defining ideal and yields `T_g Q_M≅Q_M`. Their direct sum is
therefore objectwise invariant under all `G(ℂ[[t]])`; consume A3's proof that
it has no common `K_N` integrating its given left current action. Prove each
conjugation action is rational by a finite PBW-degree/order window
factoring through a finite jet, with locally nilpotent positive-current
adjoint operators. Assemble the natural conjugation maps into strict coherent
weak `G(ℂ[[t]])` equivariance of each Q_M and its direct sum. Its derivative
is `ad(x)=left(x)−right(x)`, rather than the given left action on all summands.
Prove these objectwise/coherent-weak comparisons and consume A3's
nonintegration theorem. This example separates coherent weak equivariance
from rational integration with the prescribed Lie derivative.

The source's arithmetic analogy introduces local Langlands motivation, not an
additional unconditional equivalence between these categories and arithmetic
representations. Preserve that distinction when specifying examples.

## R4. Equivariant groupoid transport and the categorical-lift conjecture

For any groupoid `Γ` and group `H`, use the product category
`Γ × SingleObj H`. Define coherent equivariant transport to be a pseudofunctor

`F : LocallyDiscrete (Γ × SingleObj H) ⥤ᵖ Cat`

together with, for each `p`, a strong transformation from the restriction of
`F` to `{p} × SingleObj H` to the specified `H` action on the actual fiber
category, whose component functors are equivalences. Restriction uses the
native `Prod.sectR` and `Functor.toPseudofunctor`. This fixes the fibers and
their actions up to equivariant equivalence and retains all groupoid isotropy.

Construct the bicategory of these lift packages: 1-morphisms are strong
transformations with equivariant comparison isomorphisms on the prescribed
fibers; 2-morphisms are compatible modifications. On its sub-bicategory of
equivalences and invertible modifications, prove a biequivalence with normalized
transport data on the actual fibers. This is not an equivalence of the raw
package types. Normalization conjugates the joint functors by chosen inverses
to the fiber comparisons; the reverse construction uses identity comparisons.
Construct the unit/counit strong equivalences and their modifications.

The normalized data consist of functors
`E_g:C_p→C_q`, unit isomorphisms, composition isomorphisms
`E_g ⋙ E_h ≅ E_(hg)`, and natural commuting isomorphisms
`T_a^p ⋙ E_g ≅ E_g ⋙ T_a^q`, with all unit, associativity and mixed product
diagrams. Mixed diagrams follow by comparing the two factorizations of
`(g,a)` in the product category. Prove every `E_g` is an equivalence using
`g⁻¹`, and construct the groupoid actions of automorphism groups at each object.
Construct morphisms and invertible modifications of lift packages and prove
their component formulas; independent choices of arrow equivalences are not
assumed to admit coherent composition.
For complex-linear fibers, impose linearity on the actual transported functors
after the fiber comparisons, using native `Functor.Linear`. Prove this property
is invariant under linear equivariant comparison and that equivalences of the
abelian fiber categories preserve the required exact structures. The critical
conjecture uses this linear refinement, not arbitrary semilinear category maps.

For the specific `Γ=IsomOp_{G∨}(D×)`, define the **critical categorical-lift
conjecture** as nonemptiness of this precise package with fibers and `H`
actions from R3. Formalize the package and its consequences; do not add a
`sorry` theorem asserting its nonemptiness as a roadmap proof obligation.
The source asks for this lift and presents its existence as conjectural.
An unqualified global geometric Langlands theorem is not this conjecture.

Construct the trivial-group comparison and the obstruction represented by
incoherent chosen compositors. R5 owns transport along a groupoid equivalence. In the one-object scalar case, a chosen compositor is a
unit-valued
2-cochain; prove the associativity equation is the 2-cocycle equation and a
change of trivializations acts by the corresponding coboundary. State the
scalar-central-automorphism hypothesis explicitly. This example shows why the
coherence condition has mathematical content.

## R5. Descent, outer derivations and relative transport

### R5.1. Complex-point descent

For an equivalence `Γ≌Λ`, construct the induced equivalence of product
groupoids with `SingleObj H` and the biequivalence on pseudofunctors to `Cat`.
Construct quasi-inverses, units, counits and comparisons on strong
transformations/modifications. Prove compatibility with prescribed fiber
actions. Convert fully faithful, essentially surjective functors into
equivalences with chosen data before applying this construction.

Apply this to `IsomOp→Loc_{G∨}(D×)` on complex points. Full faithfulness is
its arrow definition; essential surjectivity is F6's oper-lift theorem.
Conditional on an R4 lift, construct descent and prove independence up to
pseudonatural equivalence and modification. A local-system fiber is therefore a
category up to coherent equivalence. Choosing an oper lift presents it as the
corresponding full subcategory of `Ccrit`; this does not select an intrinsic
full subcategory independent of that lift. This target is complex-point descent,
not a claim of fpqc essential surjectivity over all coefficient algebras.

### R5.2. The unconditional infinitesimal bridge

Put `A=Ûκc`, `Z=center(A)`. Consume A6's flat full `ℂ[[ℏ]]` deformation
`A_ℏ` at `κc+ℏκ0` for A2's original root-normalized `κ0`, its compatible
`ℏ^r` truncations, and the central Poisson bracket. Use the native
`TauCeti.derivationLieAlgebra ℂ A`, a Lie subalgebra of `Module.End ℂ A` with
the associative Leibniz equation. Mathlib's commutative `Derivation` carrier is
used only on the commutative center. Define its sub-Lie-algebra of continuous
derivations, with topology induced by pointwise convergence in `A^A`. Prove the
actual inner derivation image is a Lie ideal, and form
`OutDer_cont(A)` by that image, with quotient topology. Do not replace the image
by its closure: the
inner natural isomorphisms below use actual elements of `A`.

Consume A6's continuous coefficient-linear ordered-PBW specialization section
`s:A→A_ℏ`, its stage-kernel compatibility, division-by-ℏ estimates and
continuous product defect `c(z,w)=(s(zw)−s(z)s(w))/ℏ mod ℏ`.
For `z∈Z` and an admissible lift `z_ℏ∈A_ℏ`, consume A6's continuous
operator `δ_z(a)=[z_ℏ,a_ℏ]/ℏ mod ℏ`, its independence of `a_ℏ`, Leibniz
identity and change-of-lift formula `δ_(z_ℏ+ℏ b_ℏ)=δ_z+ad_b`.
Package it into native `TauCeti.derivationLieAlgebra`; do not reconstruct the
operator or its division bounds. Construct the continuous `Z`-linear map
`θ:Ω¹_cont(Z)→OutDer_cont(A)`, `θ(dz)=[δ_z]`, through the completed-coordinate
chart supplied by F5 and the central generators `S_a` supplied by A8.
For `ξ=Σ_a f_a dS_a`, construct the actual representative
`D_ξ(a)=Σ_a f_a δ_(s(S_a))(a)` by stagewise convergence. Prove existence,
continuity in a and ξ, and scalar linearity. Prove
`z∈Z∩ker π_N ⇒ zA⊆ker π_N`; combine this with A6's right-multiplication
estimates and ℏ-torsion-free stages to control arbitrary central coefficients.
For two continuous stage-compatible sections, prove their representative
change is `ad_b` for the actual convergent sum `b=Σ_a f_a b_a∈A`.

Construct a separate coefficient-linear central-monomial lift `s̃:Z→A_ℏ`:
lift each `S_i[r]` by `s(S_i[r])`. For weight `w_i=d_i+1`, order factors by
increasing depth `floor(r/w_i)` from left to right, breaking equal depths by a
fixed order on the finite generator index and then on r. This uses A8's exact
threshold `S_i[r]∈ker π_N ⇔ r≥w_i N`: if any factor belongs to that stage
kernel, the rightmost factor does too. Each stage has coordinates r<w_i N,
and each polynomial uses finitely many of them; use A8's actual quotient
polynomial chart and its bounded-index transitions. In rank one all w_i=2,
so this agrees with increasing mode index. Raw mode index alone is insufficient
when generator weights differ. This is a linear ordered-monomial lift, not
an algebra homomorphism. Prove its continuous extension, stage-kernel
compatibility and `δ_(s̃(z))=D_(dz)` for every `z∈Z`. Define the actual continuous
inner correction `b(z)=(s(z)−s̃(z))/ℏ mod ℏ`, using A6's division estimates.
Then prove `θ(dz)=[δ_(s(z))]` for every z. Use this fixed ordering also in
computing the inner correction for the cotangent Lie bracket below, and prove
that correction converges in A. No convergence claim is made for a sum of
product-defect terms in arbitrary factor order: changing that order can
accumulate divergent central terms although their inner derivations converge.
Define θ as the class of D_ξ and prove independence of admissible lift sections.
The differential chart is topologically free on its coordinate differentials;
there are no unspecified presentation relations. The quotient by the actual
inner image need not be separated, so this construction uses no complete
separated universal property for that quotient.
Prove each derivation preserves `Z`, inner derivations restrict to zero there,
and restriction gives the anchor `θ(dz)(w)={z,w}`. Establish the Lie–Rinehart
identities `θ([ξ,η])=[θξ,θη]` and
`[ξ,fη]=f[ξ,η]+anchor(ξ)(f)η`, using the A6 `h³`/full-family comparison.
Under A8, the original `κ0` pairs with the dual inverse Cartan form `κ0∨`
from F7; retain that normalization in the Poisson/anchor comparison.
The continuous differential module, cotangent bracket and its identification
with the source-fixed dual-gauge Lie algebroid are F7–F8 exports, not a second
construction here. Use F8's pinned sign: Hamiltonian cotangent label `dH_x`
corresponds to the left-gauge label `−x`.

For a continuous derivation `δ` and a smooth `A`-module `M`, construct the
smooth module `Eδ(M)=M⊕M` with
`a·(u,v)=(a·u+δ(a)·v,a·v)`. Prove the short exact sequence
`0→M→Eδ(M)→M→0` with injection `u↦(u,0)` and projection `(u,v)↦v`.
For `δ'=δ+ad_b`, prove `(u,v)↦(u+b·v,v)` is the natural extension
isomorphism `Eδ(M)→Eδ'(M)`. Lift the actual short complex, including both
maps, to A5's continuous full subcategory using the proved continuity of Eδ
and native `ObjectProperty.homMk`/`lift`. Prove `ShortExact` there. Pin the module
universe to `max u w`, as required by A5's continuous-coinduction/enough-injectives
and `HasExt` suppliers. Form `ShortComplex.ShortExact.extClass` in this smooth
category; an ambient ModuleCat sequence alone does not define that class.

Construct the generic comparison, for any abelian category with `HasExt`,
between pullback/pushout Baer sum and addition under native `extClass`.
Specialize it here and identify the Baer sum of Eδ and Eη with `E_(δ+η)`.
Use the native Ext exact-sequence/naturality API for the connecting class,
with A5's smooth-category HasExt instance. Prove center-scalar linearity and functoriality: for `f:M→M'`, pushforward of the class for `M`
equals pullback of the class for `M'` in `Ext¹(M,M')`.
Use A5's enough injectives and explicit native `hasExt_of_enoughInjectives`
adapter to obtain `Ω¹_cont(Z)→Ext¹_Ccrit(M,M)`.

For `M∈Ccrit(p)`, a central `z` acts on `Eδ(M)` by the block matrix
`[[χp(z),χp(δz)],[0,χp(z)]]`. With `ε(u,v)=(v,0)`, this is the dual-number
character `χp+ε(χp∘δ|Z)`. It is an ambient smooth-category extension and a
first-order motion of the character; it is generally not an extension inside
the fixed strict-character category. Prove this matrix/character formula and
its agreement with the cotangent anchor. These constructions give the
infinitesimal extension class, rather than a theorem integrating an arbitrary
outer-derivation action to groupoid transport.

### R5.3. Relative module family and the formal refinement question

Let `Art_ℂ` consist of finite-dimensional commutative augmented local Artinian complex
algebras with residue field ℂ and augmentation-preserving algebra maps.
For `R∈Art_ℂ`, use the polynomial affine Lie algebra at level `κc` over `R`
and vectorwise smooth modules, including all modules rather than just flat
ones. Construct the finite scalar-extension adapter to A5's completion from
its left-ideal module quotients. Prove finite coefficient extension commutes
with those quotients and compatible families, the action extends uniquely,
and the two module presentations agree. Extend A2's loop automorphism formula
coefficientwise to `H_R=G(R((t)))`, proving its order-shift and product laws.
R5.3 owns these finite-Artinian scalar-extension adapters to A2/A4/A5;
ALA owns the general completion/lift/category foundations. Prove `H_R` fixes
`R⊗_ℂ Z` pointwise using the finite coefficient comparison and the A8
center-fixing identities. Hence the strict R-character fibers are stable.

Use F5's native oper evaluation over `R`, with its common pole-bound and
base-change laws, and A8's center isomorphism to define `χ_p` for every
`p∈Op_{G∨}(D×)(R)`. Consume A5's strict-character equation to form `C_R(p)`.
For `u:R→S`, construct `B_u(p):C_R(p)→C_S(u p)` by `S⊗_R M`, prove its
smoothness and completed-action comparison, and build the unit, tensor
composition and associativity comparisons. Prove u-semilinearity on Hom
spaces, `B_u(r f)=u(r) B_u(f)`, and the equivariant comparison
`B_u(p) ∘ T_h^p ≅ T_(u h)^(u p) ∘ B_u(p)` with its unit/product diagrams.
These functors need not be equivalences. Flat modules form an explicitly
separate object property.

Use the F8 groupoid `Γ_R=IsomOp(R)` and the actual `H_R` actions. A relative
lift consists of joint pseudofunctors
`F_R:LocallyDiscrete(Γ_R×SingleObj H_R)→Cat` with equivalences
`e_(R,p):F_R(p,*)≌C_R(p)` respecting the original-loop actions. Require
R-linearity of each actual fiber transport after these comparisons. For
`u:R→S`, use the domain functor `D_u(g,h)=(u g,u h)` and a strong base-change
transformation `β_u:F_R⇒F_S∘D_u`, with specified invertible 2-cells

`β_u(p) ⋙ e_(S,u p).functor ≅ e_(R,p).functor ⋙ B_u(p)`.

Require these cells to respect both gauge-arrow and H_R naturality, including
the B_u equivariance just constructed. Specify the modification identifying
β_id with the identity and the compositor identifying two successive β's with
β_(v∘u). For three coefficient maps require the two composites to coincide
after the native associator; impose both identity triangles as well. Require
compatibility with the joint pseudofunctor unit/product compositors. This
specifies a family on the Grothendieck construction with actual prescribed
fiber and base-change comparisons.

Define the formal refinement question as nonemptiness of this complete relative
lift type with the following compatible infinitesimal data. For
`R=ℂ[ε]/ε²`, fix the source to the constant lift of p and consider arrows
reducing to id_p. Use F8's source-fixed algebroid fiber, choose a global
cotangent extension of ξ at p, and use R5.2's stage-compatible representative
D_ξ. Prove two extensions differing by the closed span of
`m_p·Ω¹_cont(Z)` act identically on the strict-character module: central
coefficients in m_p kill M, and the relevant convergent limits act by zero
using its discrete continuity. Index all further representative comparisons
by actual elements b∈A and equations `δ'=δ+ad_b`. Supply the natural
comparison `(u,v)↦(u+bv,v)`; require identity/addition/composition diagrams.
For c∈Z, retain its automorphism `1+εχ_p(c)` rather than identifying choices
b and b+c. These central comparison cells are part of the refinement data.

Require the actual first-order transport to be compared to restriction through
`(id−εδ)⁻¹=id+εδ`, with target character `χp+εχp∘δ|Z` and underlying
extension Eδ. The comparison must be H_R-equivariant. From A6's
level-dependent action on A_ℏ and the chosen PBW lifts, construct actual
coherent elements
b(γ,ξ): on the coordinate differential dS_a use A6's divided change of
s(S_a), and extend Z-linearly by the convergent coefficient presentation of
D_ξ. For every z this is
`b(γ,dz)=(a_(ℏ,γ)(s̃(z))−s̃(z))/ℏ mod ℏ`, using the same ordered lift
as `D_(dz)=δ_(s̃(z))`. Prove the equality with the coefficient formula;
A6's lift-quantified export applies to s̃(z). For the alternative representative
δ_(s(z))=D_(dz)+ad_(b(z)), its correction is instead
`b(γ,dz)+(a_γ−1)b(z)`. Retain that actual-b comparison; do not identify the
two representatives' correction elements. Prove
`a_γ δ a_γ⁻¹=δ+ad_(b(γ,ξ))` and the actual unit/product laws
`b(1,ξ)=0`, `b(γγ',ξ)=b(γ,ξ)+a_γ b(γ',ξ)`.
Use their inner natural isomorphisms in the commuting comparison with T_γ.
For an infinitesimal original loop `1+η y`, prove the mixed identity
`[δ,ad_y]=ad_(δ(y))` and impose the corresponding εη comparison with the
first-order gauge transport. Here y denotes its actual current image in A.
These comparison cells supply the original-loop infinitesimal equivariance.

For `ℂ[ε,η]/(ε²,η²)`, consume F8's mixed dual-gauge calculation and retain its
cotangent sign. With `a_g=id−εδ_x`, `a_h=id−ηδ_y`, prove the flow product
`g_h⁻¹g_g⁻¹g_h g_g` gives module restriction through
`id+εη[δ_x,δ_y]`. Require its compositor comparison, independence under the
indexed inner changes, unit identities and scalar/base-change naturality.
F8 owns the gauge Lie-algebroid calculation; R5 owns these category/inner-cell
comparisons.

Define the two-jet refinement by restricting this exact relative package to
`R` with maximal ideal cube zero. Define the all-Artinian refinement by the full
`Art_ℂ` package. Construct the forgetful maps from the all-Artinian type to the
two-jet type and to R4's complex-point type, and the R5.2 extension-class
comparison extracted from any compatible refinement. Their nonemptiness is
separately named conjectural data; neither the outer-derivation theorem nor
R4's pointwise conjecture asserts it. This makes the proposed algebroid lift
and integration route precise without asserting an unconditional integration
theorem.

## Grounding and validation

Mathlib's [monoidal action definitions](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/CategoryTheory/Monoidal/Action/Basic.lean),
[endofunctor comparison](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/CategoryTheory/Monoidal/Action/End.lean),
[locally discrete bicategories](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/CategoryTheory/Bicategory/LocallyDiscrete.lean),
and [pseudofunctor/strong-transformation API](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/CategoryTheory/Bicategory/NaturalTransformation/Pseudo.lean)
are the native carriers. The
[composition-order discussion](https://leanprover.zulipchat.com/#narrow/near/523092176)
explains the left/right action distinction. Follow that design.
[Mathlib PR32410](https://github.com/leanprover-community/mathlib4/pull/32410)
develops pseudofunctor evaluation with `eval` and `evaluation`; use those
interfaces for the R5 family comparisons, constructing the needed forms here
against the available pin. It is not a timing dependency.

The mathematical source is the local-category discussion in
[Frenkel, Langlands Correspondence for Loop Groups](https://math.berkeley.edu/~frenkel/loop.pdf)
and the critical representation setting in
[Frenkel–Gaitsgory, Local geometric Langlands correspondence and affine Kac–Moody algebras](https://arxiv.org/abs/math/0508382).
[Johnson–Yau, 2-Dimensional Categories](https://arxiv.org/abs/2002.06055)
supplies the general pseudofunctor/coherence reference. Formal/algebraic
gauge foundations and finite-dimensional smooth groupoid foundations have
different owners; this roadmap uses the former.

Acceptance requires consumption of the actual A5/A8 character categories and
comparisons, checked left-action composition order, semidirect covariance, mixed
coherence diagrams, isotropy preservation, conditional descent, the continuous
outer-derivation/self-extension bridge, and the specified relative lift types. The
conjecture must be represented by the complete type of lift data, never by an
empty `Prop` field or by an unconditional existence theorem. Suggested Lean
signatures are interface checks, not proofs of the mathematical targets.
