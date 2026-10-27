# Quaternionic analysis

Quaternion multiplication is noncommutative, so the order in a difference quotient, a derivative map, a Cauchy kernel, or a product rule is part of the theorem. This roadmap develops quaternion-valued analysis on open subsets of the real quaternion algebra `ℍ`, and keeps two different notions of regularity separate: quaternion quotient differentiability and the Cauchy–Riemann–Fueter equations.

## Conventions and scope

Write `q = t + i x + j y + k z` in that coordinate order. For `a = α+iβ+jγ+kδ`, use `Lₐ(h)=a*h` and `Rₐ(h)=h*a`. Thus `Lₐ` is right-`ℍ`-linear and `Rₐ` is left-`ℍ`-linear. These module-linearity names are not quotient-side names:

* The **left quotient derivative** is `limₕ→0 h⁻¹*(f(q+h)-f(q)) = b`. Its real Fréchet derivative is `R_b(h)=h*b`.
* The **right quotient derivative** is `limₕ→0 (f(q+h)-f(q))*h⁻¹ = a`. Its real Fréchet derivative is `L_a(h)=a*h`.

Use Mathlib's `Quaternion ℝ`, its coordinates and normed algebra instances, `HasFDerivAt` over `ℝ`, and the native multiplication linear/continuous maps. The pinned Mathlib quaternion coordinate foundation already provides `QuaternionAlgebra.equivTuple`, `QuaternionAlgebra.linearEquivTuple`, the coordinate linear maps `QuaternionAlgebra.reₗ`, `imIₗ`, `imJₗ`, `imKₗ`, and the component multiplication formulas `Quaternion.re_mul`, `imI_mul`, `imJ_mul`, and `imK_mul`; build the matrices from these APIs instead of creating parallel coordinate infrastructure. For constructor-level identities, the pinned Mathlib has `QuaternionAlgebra.star_mk` (for `ℍ`, where `c₂=0`, conjugation of `⟨a₁,a₂,a₃,a₄⟩` negates the three imaginary coordinates) but no constructor multiplication formula; prove `mk_mul_mk` (the product of two constructors is the constructor of the four component formulas above) locally in the same constructor form and use it; do not introduce a second quaternion carrier, duplicate coordinate API, or push this work to Mathlib. For the rigidity bridge write `q=v+jw`, `v=t+ix`, `w=y-iz`. The left-quotient proof uses the complex structure `λ •ₗ q := (λ : ℍ)*q` and coordinate equivalence `Φₗ(q)=(v, conjugate w)`. If `f(q)=g(v,w)+j h(v,w)`, its output coordinates are `(g, conjugate h)`; the first-order equations make both coordinates holomorphic as functions of `(v, conjugate w)`. This scalar action commutes with `R_b(h)=h*b`. The right-quotient proof uses `λ •ᵣ q := q*(λ : ℍ)` and `Φᵣ(q)=(v,w)`, with output coordinates `(g,h)`; this action commutes with `L_a(h)=a*h`. Prove these coordinate equivalences and scalar-compatibility identities from the native quaternion coordinates before applying complex analysis.

For mathematical statements transcribed from the notes, use the normalized coordinate dictionary `w ↦ t`, `h,i,j ↦ i,j,k`, and `k,l,m,n ↦ K,L,M,N`.

The scope includes the exact real matrices and component equations for `Lₐ` and `Rₐ`; the two quotient derivatives and their calculus; their full connected-open classification without a `C¹` or `C²` assumption; simultaneous-side differentiability; and left/right Fueter regularity, analyticity, harmonicity, and Cauchy theory. It excludes a general quaternionic version of the complex conformal mapping classification. Any use of “biholomorphic” must specify which derivative notion is required of the map and inverse.

## Milestones

### 1. Real quaternion coordinates and multiplication maps

Prove the coordinate formulas for both real multiplication maps from native quaternion multiplication, with input and output order fixed as `(t,x,y,z)`. In that order,

```text
Lₐ = [[ α, -β, -γ, -δ],
      [ β,  α, -δ,  γ],
      [ γ,  δ,  α, -β],
      [ δ, -γ,  β,  α]]

Rₐ = [[ α, -β, -γ, -δ],
      [ β,  α,  δ, -γ],
      [ γ, -δ,  α,  β],
      [ δ,  γ, -β,  α]]
```

Expose each entry and prove `Lₐ∘L_b=L_{ab}`, `Rₐ∘R_b=R_{ba}`, `Lₐ∘R_b=R_b∘Lₐ`, inverses `Lₐ⁻¹=L_{a⁻¹}` and `Rₐ⁻¹=R_{a⁻¹}` for nonzero `a`, norm scaling `‖Lₐ(q)‖=‖Rₐ(q)‖=‖a‖‖q‖`, and determinants `det Lₐ=det Rₐ=‖a‖⁴`. Also prove the conversion between a real Fréchet derivative and its four output-coordinate partial derivatives. Write an arbitrary output as `K+iL+jM+kN`, with component functions `K,L,M,N`, and use input coordinates `(t,x,y,z)`. The `Lₐ` equalities are `K_t=L_x=M_y=N_z`, `K_x=-L_t=M_z=-N_y`, `K_y=-L_z=-M_t=N_x`, `K_z=L_y=-M_x=-N_t`; for `Rₐ` they are `K_t=L_x=M_y=N_z`, `K_x=-L_t=-M_z=N_y`, `K_y=L_z=-M_t=-N_x`, `K_z=-L_y=M_x=-N_t`. These systems characterize the respective multiplication subspaces among all real-linear maps, not the Fueter equation.

### 2. One-sided quotient calculus

Use `HasFDerivAt` with derivative respectively `(ContinuousLinearMap.mul ℝ ℍ).flip b` and `(ContinuousLinearMap.mul ℝ ℍ) a` as the primary definitions of the two quotient-derivative predicates. Prove uniqueness of the coefficient and equivalence with the literal limits displayed in Conventions. State these equivalences using the same increment `h`, with all limits over `𝓝[≠] (0 : ℍ)`:

```text
left quotient:  h⁻¹ * (f(q+h)-f(q)) → b
  iff ‖f(q+h)-f(q)-h*b‖ / ‖h‖ → 0;
right quotient: (f(q+h)-f(q)) * h⁻¹ → a
  iff ‖f(q+h)-f(q)-a*h‖ / ‖h‖ → 0.
```

Derive each direction directly from the real Fréchet remainder estimate and norm multiplicativity in `ℍ`, using the same nonzero increment `h`; do not replace it by its inverse. Prove sum and real-scalar rules, and the following exact closure criteria at a point `q`, assuming the displayed derivatives exist:

* For left-quotient slopes `b_f,b_g`, `D(fg)` is a left-quotient derivative exactly when `b_g=0` or `f(q)∈ℝ`; when it is, its slope is `b_f*g(q)+f(q)*b_g`.
* For right-quotient slopes `a_f,a_g`, `D(fg)` is a right-quotient derivative exactly when `a_f=0` or `g(q)∈ℝ`; when it is, its slope is `a_f*g(q)+f(q)*a_g`.
* At `f(q)≠0`, the inverse is left-quotient differentiable exactly when `b_f=0` or `f(q)∈ℝ`, with slope `-(f(q)⁻¹*b_f*f(q)⁻¹)`; it is right-quotient differentiable exactly when `a_f=0` or `f(q)∈ℝ`, with slope `-(f(q)⁻¹*a_f*f(q)⁻¹)`.
* For composition `f ∘ g`, assume `g` has the indicated derivative at `q` and `f` at `g(q)`. The same-sided class is closed: left slopes compose in order `b_g*b_f`, and right slopes in order `a_f*a_g`.

Include constants, affine maps, coordinate projections, and prove `q ↦ q²` fails each quotient-differentiability condition on every nonempty open set (the derivative `h ↦ hq+qh` is not a one-sided multiplication map at nonreal `q`). State pointwise and setwise `DifferentiableAt`/`DifferentiableOn` interfaces. State the corresponding general real Fréchet product and inverse rules separately, without implying the quaternionic subclasses are closed when the criteria above fail.

The course-note question (transcribed “Cauchy–Gaussat”) also requires a negative distinction: these quotient-differentiability classes do not imply an ordinary quaternion-valued 1-form loop theorem. The identity `f(q)=q` has both quotient slopes equal to `1`, yet on the positively oriented unit square `q=i x+j y`, with boundary `0 → i → i+j → j → 0`, direct edge integration gives

```text
∮ q dq = (-1/2) + (k-1/2) + (k+1/2) + (1/2) = 2k,
∮ dq q = (-1/2) + (-k-1/2) + (1/2-k) + (1/2) = -2k.
```

Thus neither ordered ordinary 1-form integral vanishes, even for the identity function. This explicit counterexample answers the mathematical issue without interpreting or correcting the handwritten surname in the note. It is separate from the Fueter 3-form Cauchy theory in Milestone 5.

### 3. Rigidity without assumed higher regularity

For connected open `Ω ⊆ ℍ`, prove both directions of the classifications

```text
left quotient differentiable at every q ∈ Ω  ↔  ∃ a b, ∀ q ∈ Ω, f q = a + q*b
right quotient differentiable at every q ∈ Ω ↔  ∃ a b, ∀ q ∈ Ω, f q = a + b*q.
```

Also prove the corresponding local-on-connected-components form and uniqueness of the affine coefficients when `Ω` is nonempty. No `C¹` or `C²` regularity is a premise. For the left-quotient proof, let `Fₗ = Φₗ ∘ f ∘ Φₗ⁻¹` on `Φₗ(Ω)⊆ℂ²`; the real derivative becomes complex-linear because it commutes with `λ •ₗ q=(λ:ℍ)*q`. Use `hasFDerivAt_of_restrictScalars` from `Mathlib.Analysis.Calculus.FDeriv.RestrictScalars`: given a real derivative `D`, construct the complex-linear derivative `Dℂ` and prove `(Dℂ).restrictScalars ℝ = D`; this upgrades the real `HasFDerivAt` to `HasFDerivAt ℂ` and hence `DifferentiableOn ℂ Fₗ (Φₗ(Ω))`. For the right-quotient proof use `Fᵣ = Φᵣ ∘ f ∘ Φᵣ⁻¹` and the commuting right scalar action `λ •ᵣ q=q*(λ:ℍ)`. Apply Tau Ceti's pinned theorem `DifferentiableOn.analyticOnNhd_of_finiteDimensional` from `TauCeti.Analysis.Complex.CauchyIntegralPolydisc`; its declaration is `_root_.DifferentiableOn.analyticOnNhd_of_finiteDimensional`, with assumptions `[NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E] [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]`, and type `DifferentiableOn ℂ F s → IsOpen s → AnalyticOnNhd ℂ F s`. Instantiate `E=V=ℂ×ℂ`. For the left case, analytic regularity gives a `C²` map, now derived rather than assumed. Write its first derivative as `Df(q)=R_{b(q)}`. Symmetry of the second derivative gives `h * Db(k) = k * Db(h)`; setting `k=1` yields `Db(h)=h*c` for `c=Db(1)`, and taking `h=i,k=j` forces `(ij-ji)*c=0`, hence `c=0`. Thus `b` is locally constant; connectedness makes it constant, and `f-q*b` is constant. Prove the local affine statement on connected components and patch by connectedness. For the right case, prove that `T(f)(q)=conjugate(f(conjugate q))` sends right slope `a` to left slope `conjugate a`, then reduce to the left proof. This named finite-dimensional theorem is the regularity step; do not replace it with an unspecified Hartogs lemma or assert smoothness without deriving it.

Prove that if both quotient limits exist at one point then their real differential is a common `Lₐ=R_b`; evaluating at `1` and commuting with arbitrary quaternions shows `a=b∈ℝ`. Consequently simultaneous left- and right-quotient differentiability throughout a connected open set is exactly a real-slope affine map `q ↦ a + r*q`, `a∈ℍ`, `r∈ℝ`. Distinguish this from bijectivity plus a one-sided differentiable inverse: `q ↦ i*q` and `q ↦ -i*q` satisfy the latter and have non-real slope.

### 4. Left and right Fueter operators and pointwise regularity

Define the operators, fixing multiplication order,

```text
∂̄ₗ f = ∂ₜf + i*(∂ₓf) + j*(∂ᵧf) + k*(∂zf)
∂̄ᵣ f = ∂ₜf + (∂ₓf)*i + (∂ᵧf)*j + (∂zf)*k.
```

For a real Fréchet derivative `D : ℍ →L[ℝ] ℍ`, define

```text
FueterLeft(D)  := D(1) + i*D(i) + j*D(j) + k*D(k) = 0
FueterRight(D) := D(1) + D(i)*i + D(j)*j + D(k)*k = 0.
```

A function is left/right regular on an open set exactly when `HasFDerivAt f D q` holds at each point for some `D` satisfying the corresponding predicate. This is pointwise real Fréchet differentiability plus the Fueter equation; continuity of the derivative is not a hypothesis. For `f=K+iL+jM+kN`, prove equivalence with these explicit real systems:

```text
left:  Kt-Lx-My-Nz = 0,  Lt+Kx+Ny-Mz = 0,
       Mt-Nx+Ky+Lz = 0,  Nt+Mx-Ly+Kz = 0
right: Kt-Lx-My-Nz = 0,  Lt+Kx-Ny+Mz = 0,
       Mt+Nx+Ky-Lz = 0,  Nt-Mx+Ly+Kz = 0
```

Prove the exact relation with quotient differentiability: for `a+q*b`, the left Fueter operator is the constant `-2b`; for `a+b*q`, the right Fueter operator is `-2b`. Thus in each corresponding one-sided affine class Fueter regularity is equivalent to zero slope. Exhibit `f(t+ix+jy+kz)=t+ix`: verify it is nonconstant and annihilated by both operators, then show its real derivative is not a multiplication map on any nonempty open set. Prove each side's regular functions are closed under addition, real scalar multiplication, real dilation of the argument `q ↦ r*q` for `r : ℝ`, translation of the argument, and its matching constant multiplication: left regularity is preserved by `f ↦ f*b` for constant `b`, while right regularity is preserved by `f ↦ b*f`. These claims follow directly from the corresponding ordered PDE. Do not infer Fueter closure from the quotient-subclass product or composition criteria in Milestone 2. State the exact coefficient-conjugating reflection `T(f)(q)=conjugate(f(conjugate q))`: it interchanges left and right regularity and must be used, with its side and coefficient order proved, for the symmetry rules. Products and compositions of arbitrary Fueter-regular functions have no unrestricted closure claim here.

### 5. Forms, Goursat theorem, and Cauchy–Fueter formula

Consume real differential forms and exterior differentiation, together with Differential Geometry’s generic smooth integration and Stokes API; these smooth interfaces do not supply the continuous face integrals used below. Define `dq=dt+i dx+j dy+k dz` and the ordered quaternion-valued form

```text
Dq = dx∧dy∧dz - i dt∧dy∧dz - j dt∧dz∧dx - k dt∧dx∧dy.
```

Freeze orientation, boundary and multiplication conventions in the definitions. Before the Cauchy theorem, define a raw fixed-affine-face functional for continuous quaternion coefficients for every affine map `A(u)=p+L(u)` on `[0,1]^4`, including singular and negative-determinant `L`: it is the sum over the eight coordinate facets, integrating the pulled-back coefficient against the ordered chart-tangent `Dq` on each facet. This parameter-domain orientation defines the raw functional without assuming a geometric outward orientation. For invertible `L`, write `C=A([0,1]^4)`. The raw orientation agrees with geometric outward orientation exactly when `det L>0`; use `det L>0` for the geometric Cauchy formula. Prove the typed reparametrization laws directly from the chart definition: precomposition by `ρ(u₀,u₁,u₂,u₃)=(1-u₀,u₁,u₂,u₃)` negates the raw boundary functional, and affine pushforward by quaternion conjugation `σ(q)=conjugate q` obeys `Raw(σ∘A, ω) = Raw(A, σ*ω)` for every pulled-back coefficient form `ω` (where `σ*Dq=-conj(Dq)`). Both `ρ` and `σ` have determinant `-1` in `(t,x,y,z)`, so `σ∘A∘ρ` has positive determinant whenever `A` does and parameterizes the reflected geometric parallelepiped with positive orientation. This defines the negative-determinant intermediate cases needed for right-sided reflection while reserving outward geometry and the Cauchy formula for positive determinant. Parameterize each facet by the corresponding `[0,1]^3` chart with the fixed parameter-domain orientation (which is outward-first exactly when `det L>0`), and define the primary integral of the pulled-back `Quaternion ℝ` coefficient as a Bochner integral over `Icc (0 : Fin 3 → ℝ) 1`; use the native `BoxIntegral` only through the equality theorem proved below. Use `QuaternionAlgebra.linearEquivTuple (-1) 0 (-1)` to identify `Quaternion ℝ` with `Fin 4 → ℝ` in order `(re, imI, imJ, imK)` for the divergence theorem, whose domain is that sup-norm function space. The theorem uses this coordinate carrier, not `EuclideanSpace`, and no measure instance on `ℍ` is assumed. For radial mass calculations only, use `Quaternion.linearIsometryEquivTuple` to `EuclideanSpace ℝ (Fin 4)` and then native `PiLp.volume_preserving_toLp` to transfer Euclidean norm and Haar measure. Multiplication and ordered quaternion products are performed in `ℍ` before coordinatewise integration. Prove equality of this Bochner face integral with native `BoxIntegral` using `MeasureTheory.ContinuousOn.hasBoxIntegral` and `Box.coe_ae_eq_Icc` as a separate basic compatibility API; the divergence theorem consumes Bochner integrals directly and does not require this conversion. The adapter must handle all four ordered coefficients required by the theorems:

```text
Dq(v) * f(φ(u))
f(φ(u)) * Dq(v)
G(φ(u)) * Dq(v) * f(φ(u))
f(φ(u)) * Dq(v) * G(φ(u))
```

For a nondegenerate affine face chart `φ : [0,1]³ → F`, let `Jφ` be its constant 3-dimensional Jacobian and let `v̂` be the oriented orthonormal tangent triple. For each geometric ordered coefficient `B(q)`, including `G(q)*Dq(v̂)*f(q)`, `Dq(v̂)*f(q)`, `f(q)*Dq(v̂)`, and `f(q)*Dq(v̂)*G(q)`, define the pulled parameter coefficient `A(u)=Jφ*B(φ(u))`. The actual chart tangent vectors in `Dq` contribute `Jφ` exactly once. The primary face integral is the Bochner integral over `Icc (0 : Fin 3 → ℝ) 1`. Since this parameter cube has volume one, prove `‖∫ A‖ ≤ sup_u ‖A(u)‖ = Jφ * sup_q∈F ‖B(q)‖ = vol₃(F) * sup_F ‖B‖`; do not multiply by `vol₃(F)` again after incorporating chart tangents into `Dq`. Existence follows from continuity. For a degenerate face chart, alternation makes the chart-tangent value of `Dq` zero, so the raw face integral vanishes. Prove rectangular subdivision additivity and paired internal-facet cancellation as basic adapter API, used to assemble oriented subdivisions and reflected-face identities. Prove equality with native `BoxIntegral` as a separate basic API theorem, not as a premise of the Bochner divergence route.

Expose the axis-box boundary match in the exact form used by `MeasureTheory.integral_divergence_of_hasFDerivAt_off_countable`: for `a b : Fin 4 → ℝ` with `a i < b i`, set `face i = Set.Icc (a ∘ Fin.succAbove i) (b ∘ Fin.succAbove i)`, `frontFace i x = Fin.insertNth i (b i) x`, and `backFace i x = Fin.insertNth i (a i) x`. The native boundary sum is `Σ i, (∫ x ∈ face i, F (frontFace i x) i - ∫ x ∈ face i, F (backFace i x) i)`. Match each of the eight adapter facets to one top or bottom term using the 3-dimensional affine change of variables below; the face Jacobian `∏ j ≠ i, (b j-a j)` occurs exactly once. The value of `Dq` on the raw `insertNth` tangent triple is `(-1)^i eᵢ`: therefore reflect the front-face parameter exactly when `i` is odd and reflect the back-face parameter exactly when `i` is even. This gives outward-first tangent coefficient `+eᵢ` on each front face and `-eᵢ` on each back face, hence the exact native `front − back` sum. This match is a Bochner-integral equality; the `Box.coe_ae_eq_Icc`/BoxIntegral comparison is a separate compatibility theorem, not an ingredient of the match.

Prove pointwise naturality of the affine pullback derivative and exterior derivative for this fixed affine map; the generic DG pullback theorem has stronger smoothness hypotheses and does not supply this step. For smooth coefficients, prove coefficientwise in `(1,i,j,k)` that each face integral agrees with DG Layer 5.2 `integralTopForm` for the pulled-back top form on that individual oriented facet. Represent the parameter cube itself as the model with corners `I = Icc (0 : Fin 3 → ℝ) 1`: construct its coordinate partial equivalence with range `I`, prove this range convex with nonempty interior, and apply `ModelWithCorners.ofConvexRange` using a continuous coordinate clamp retraction. This is the cube's own model with corners, whose identity map is one global chart on the whole closed cube. Give each facet its own such model, affine face chart, and explicitly fixed outward-first orientation; apply DG Layer 5.2 `integralTopForm_of_tsupport_subset_chart` coefficientwise on that chart. This is an owned concrete cube-with-corners adapter over DG's generic integration API, not an assertion that a half-space or quadrant atlas covers a closed cube. Do not treat the entire cubical boundary as a manifold or invoke corner Stokes (Layer 5.5). This facetwise compatibility is required; generic smooth forms, orientations, and Stokes remain owned by Differential Geometry. No general continuous-form integration theory on arbitrary manifolds is needed.

For axis-aligned boxes, consume Mathlib's pinned `MeasureTheory.integral_divergence_of_hasFDerivAt_off_countable` in `Mathlib/MeasureTheory/Integral/DivergenceTheorem.lean`. Its hypotheses are continuity on the closed box, pointwise Fréchet differentiability on the interior away from a countable set, and integrability of the divergence; it requires no continuous derivative. In coordinates `e=(1,i,j,k)`, use the field `Fᵢ(q)=eᵢ*f(q)`. Its divergence is exactly `∂̄ₗ f`, so prove the explicit left boundary theorem `∫_{∂C} Dq f = 0` under the stated pointwise hypotheses. Extend this exact theorem to affine parallelepipeds using the adapter's proved cofactor pullback and pointwise derivative/exterior-derivative naturality. Prove and use the owned affine Bochner change-of-variables lemma for every finite `n`, in `Fin n → ℝ` coordinates and with arbitrary complete normed additive codomain `E`. For an invertible continuous linear map `L : (Fin n → ℝ) →L[ℝ] (Fin n → ℝ)`, translation `p`, affine map `A(u)=p+L(u)`, a complete real normed additive codomain `E` (with `[NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]`), and any function `w : (Fin n → ℝ) → E`, prove the totalized Bochner-integral identity

```text
∫ u in Icc (0 : Fin n → ℝ) 1, |det L| • w(A u) du
  = ∫ x in A(Icc (0 : Fin n → ℝ) 1), w(x) dx.
```

There are no continuity, measurability, or integrability premises on `w`: native Bochner integrals are totalized, and the measurable-equivalence/map-measure argument proves equality also in the nonintegrable case. Derive it from `Real.map_linearMap_volume_pi_eq_smul_volume_pi`, native `integral_map`/`setIntegral_map`, and translation invariance; state the measurable embedding and set-measure transport. For quaternion-valued coefficients use `E=Quaternion ℝ` and `w(x)=f(χ.symm x)` where `χ=QuaternionAlgebra.linearEquivTuple (-1) 0 (-1)`; keep the codomain quaternion-valued rather than applying `χ` to the output. Specialize the single theorem to `n=3` for diagonal face scaling, parameter reflections and axis-face matching, and to `n=4` for bulk parallelepiped integration and determinant/cofactor pullback. The domain carriers are product spaces and no measure instance on `ℍ` is introduced. The radial mass calculation alone uses `Quaternion.linearIsometryEquivTuple` followed by `PiLp.volume_preserving_toLp` to transfer Euclidean norm and Haar measure. Use this native divergence theorem route; do not rebuild a generic divergence theorem that Mathlib already owns. For the left Cauchy–Fueter formula, assume only `ContinuousOn f C` and, at every `q ∈ interior C`, `HasFDerivAt f D q` for a real derivative `D` satisfying `FueterLeft D`; assume `q₀ ∈ interior C`. The boundary theorem supplies the flux identity under these hypotheses, and continuity at `q₀` follows from `ContinuousOn`. Its target normalization and order are

```text
f(q₀) = (1/(2π²)) ∫_{∂C} ((q-q₀)⁻¹ / |q-q₀|²) Dq f(q).
```

State every factor order in the Lean theorem. Prove the right Cauchy theorem and right Cauchy–Fueter formula from the left results using `T(f)(q)=conjugate(f(conjugate q))`. Use the raw pushforward law `Raw(σ∘A, ω)=Raw(A,σ*ω)` for the negative-determinant reflected map and the `ρ` reparametrization law to work with the positive-determinant map `σ∘A∘ρ`. Here quaternion conjugation sends `Dq` to `-conj(Dq)`; the reparametrization supplies the compensating sign, while conjugation reverses coefficient order. Conjugation reverses coefficient order. Prove the full ordered kernel identity by the pointwise coefficient calculation

```text
Σᵢ ∂ᵢ (G(q) * eᵢ * f(q)) = (∂̄ᵣ G)(q) * f(q) + G(q) * (∂̄ₗ f)(q) = 0
```

off `q₀`; prove both Fueter equations for `G(r)=r⁻¹/|r|²` off zero. This is the closedness/cancellation of the kernel-weighted 3-form, not a product-closure assertion for Fueter-regular functions. For the point singularity, choose the native smooth nondecreasing cutoff `ψ(s)=Real.smoothTransition (2*s-1)`, zero for `s≤1/2` and one for `s≥1`, smooth and monotone by `Mathlib/Analysis/SpecialFunctions/SmoothTransition.lean`; take `ε>0` small enough that the closed radius-`ε` ball about `q₀` lies in `int C`. The cutoff-field divergence is supported on the annulus `ε/2≤‖q-q₀‖_ℍ≤ε`, where `‖·‖_ℍ` is the quaternion Euclidean norm, and equals `ε⁻¹ ψ'(‖q-q₀‖/ε) * ‖q-q₀‖⁻³ * f(q)`. It is integrable because `f` is continuous on that compact annulus. Integrate it by the same native divergence theorem, then pass to the limit using continuity of `f` at `q₀`. For the scalar radial mass, apply native `integral_fun_norm_addHaar` in `EuclideanSpace ℝ (Fin 4)` to `r ↦ ε⁻¹ ψ'(r/ε) r⁻³`. On the divergence theorem carrier `x : Fin 4 → ℝ`, the radial profile is `‖χ.symm x-q₀‖_ℍ`; never use the sup norm of this tuple carrier as the radial variable. With this Euclidean radial profile, the integral reduces to `4 * volume(ball 0 1) * ∫_{0}^{∞} ε⁻¹ ψ'(r/ε) dr`. The native `InnerProductSpace.volume_ball_of_dim_even` with dimension four gives `volume(ball 0 1)=π²/2`, and a one-variable substitution gives the last integral `1`, so the mass is exactly `2π²`. Bound the contribution of `f(q)-f(q₀)` by its supremum on the shrinking annulus times this fixed radial mass; continuity makes that error tend to zero. Thus the flux yields exactly the normalization `1/(2π²)`. Consequently the right formula is

```text
f(q₀) = (1/(2π²)) ∫_{∂C} f(q) Dq ((q-q₀)⁻¹ / |q-q₀|²),
```

with `f` on the left of `Dq` and the same kernel on its right. Include the conjugation/coordinate-reflection calculation that yields this order and normalization. General rectifiable-chain theorems, Morera theorems, and primitive criteria are outside this roadmap. This milestone establishes the Cauchy theory under pointwise differentiability and Fueter hypotheses only; it does not yet invoke analyticity or derivative estimates.

### 6. Regularity consequences and estimates

Using the pointwise-on-compact-set Cauchy–Fueter formula from Milestone 5, prove that left- and right-Fueter-regular functions are real analytic and componentwise harmonic on their open domains. After deriving smoothness, prove harmonicity by the ordered Fueter factorizations in Mathlib's real Laplacian API. For a left-regular `f`, apply the left conjugate operator `g ↦ ∂ₜg-i∂ₓg-j∂ᵧg-k∂zg` to `g=∂̄ₗ f`; constant quaternion units and equality of mixed partials give `Δf=(∂ₜ-i∂ₓ-j∂ᵧ-k∂z)(∂ₜ+i∂ₓ+j∂ᵧ+k∂z)f`. For right-regular `f`, apply `g ↦ ∂ₜg-(∂ₓg)i-(∂ᵧg)j-(∂zg)k` to `g=∂̄ᵣ f`; this gives `Δf=∂ₜ(∂̄ᵣf)-(∂ₓ∂̄ᵣf)i-(∂ᵧ∂̄ᵣf)j-(∂z∂̄ᵣf)k`. Identify `Δf=0` coefficientwise with Mathlib's Laplacian on each real coordinate. For analyticity, prove differentiation under the fixed compact face integrals for the parameter `q₀`; the kernel and all its parameter derivatives are uniformly bounded on compact subsets of `int C` because the pole stays a positive distance from `∂C`. More concretely, for `r=q-q₀` on the boundary and a parameter increment `h`, write

```text
G(r-h) = (conjugate(r)-conjugate(h)) / |r|⁴ * (1-u)⁻²,
u = (2⟪r,h⟫ - |h|²) / |r|²,
(1-u)⁻² = Σₙ₌₀∞ (n+1)uⁿ.
```

On a sufficiently small ball of increments, `|u|≤2‖h‖/δ+(‖h‖/δ)²<1`, where `δ=dist(q₀,∂C)>0`. Regroup the uniformly and absolutely summable terms by total degree in `h`, integrate each coefficient over the finite faces, and prove the resulting series has a summable majorant and represents the Cauchy integral on a smaller ball. This gives a concrete `HasFPowerSeriesOnBall` target for the parameter integral; also prove the dominated-differentiation helper for the finite face integrals using native `hasFDerivAt_integral_of_dominated_of_fderiv_le`, after proving its common-neighborhood derivative bound and integrable dominating function on each compact face. Do not claim the polynomial derivative estimate below alone implies analyticity. Prove the connected-open uniqueness principle: if two regular functions agree on a nonempty open subset of a connected open domain, they agree throughout the domain. Equivalently, a regular function whose iterated real Fréchet derivatives of every order vanish at one point vanishes on that connected component. Do not claim that arbitrary accumulating zero sets force vanishing.

For each `m : ℕ`, prove that there is a universal constant `C_m > 0` such that for every left- or right-regular `f` on `Ω`, every `q₀ : ℍ`, and every `R > 0` with `closedBall q₀ R ⊆ Ω`,

```text
‖iteratedFDeriv ℝ m f q₀‖ ≤ C_m * R⁻ᵐ * sup_{q ∈ closedBall q₀ R} ‖f q‖.
```

For a fixed positively oriented cube `C`, first prove this representation simultaneously for every parameter `q ∈ interior C` and every `m`, as a continuous-multilinear-valued Bochner integral over the finite oriented face charts:

```text
iteratedFDeriv ℝ m f q
  = (2π²)⁻¹ * Σ_F ∫_{Icc 0 1}
      D^m[q ↦ G(φ_F(u)-q)] * Dq(v̂_F) * f(φ_F(u)) * Jφ_F du.
```

Here `D^m[q ↦ G(φ_F(u)-q)]` is the real iterated Fréchet derivative of the entire parameter function, so its value includes the chain-rule sign `(-1)^m`. Fix the currying convention at each induction step by native `iteratedFDeriv_succ_eq_comp_left` from `Mathlib/Analysis/Calculus/ContDiff/FTaylorSeries.lean`: the order-`m+1` derivative is the currying equivalence applied to the derivative of the order-`m` map. Prove the identity by induction on `m` using `hasFDerivAt_integral_of_dominated_of_fderiv_le`. For each compact parameter neighborhood `K ⊂ interior C`, supply a common-neighborhood derivative bound and an integrable face dominator; the positive distance from `K` to `∂C` keeps the kernel derivatives bounded. Do not use regrouped power-series coefficients as the iterated-derivative identity. For the universal estimate, use real homogeneity `G(λr)=λ⁻³G(r)` for `λ>0`, hence `‖D^mG(r)‖ ≤ c_m ‖r‖_ℍ^(-3-m)`, where `c_m = sup_{‖u‖_ℍ=1} ‖D^mG(u)‖ < ∞` by compactness of the unit sphere. Choose a fixed-shape positively oriented cube about `q₀` with side proportional to `R` and contained in `closedBall q₀ R`. Its face Jacobian scales as `R³`, while the differentiated kernel scales as `R^(-3-m)`, yielding a universal `C_m R⁻ᵐ` times `sup_{closedBall q₀ R} ‖f‖`. The kernel power series remains the separate concrete route to analyticity. Do not infer analyticity from constants `C_m` or claim arbitrary `C^∞` bounds imply real analyticity. The constants may depend on `m` and dimension, but not on `f`, `q₀`, `R`, or `Ω`; no sharp numerical constant is required. The regularity argument must start from the no-`C¹` Goursat/formula results, not assume continuous derivatives. For reflection, state the domain change: regularity of `f` on `Ω` corresponds to regularity of `T(f)` on `star '' Ω`; the reflected compact set is `σ '' C`, whose affine map has negative determinant. Define and use its raw boundary functional as above, then reparameterize it by `ρ` to the positively oriented affine map `σ∘A∘ρ` before applying the left theorem at `conj q₀`. The right-side conclusions follow via this explicit reflection with factor order tracked.

## Dependencies and boundaries

Use native Mathlib quaternion algebra and real Fréchet calculus. For the complex-coordinate regularity bridge in Milestone 3, import `TauCeti.Analysis.Complex.CauchyIntegralPolydisc` and apply the pinned `DifferentiableOn.analyticOnNhd_of_finiteDimensional` theorem only after proving the coordinate equivalence and complex-linearity described in Conventions. Consume generic smooth forms, orientations, integration, and Stokes from DifferentialGeometry. The fixed-affine continuous face adapter and its smooth coefficientwise agreement theorem are explicit targets here; the pointwise no-`C¹` boundary theorem uses Mathlib's native divergence theorem, not DG's smooth Stokes theorem. ConformalMapping owns complex scalar holomorphic theory and contributes slice arguments only where explicitly needed.

## Provenance

The motivating source is MATH3680 Complex Analysis notes, pages 74–75. For quaternionic rigidity and Cauchy theory see A. Sudbery, “Quaternionic Analysis,” *Math. Proc. Cambridge Philos. Soc.* 85 (1979), 199–225, [doi:10.1017/S0305004100055638](https://doi.org/10.1017/S0305004100055638).
